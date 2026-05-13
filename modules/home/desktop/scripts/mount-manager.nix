{pkgs}:
pkgs.writeShellApplication {
  name = "mount-manager";
  runtimeInputs = with pkgs; [udisks2 coreutils util-linux];

  text = ''
    set -euo pipefail

    print_usage() {
      echo "Usage: mount-manager <command> [args]"
      echo ""
      echo "Commands:"
      echo "  list                         List available USB devices"
      echo "  mount <device>              Mount a device (e.g., sdb1)"
      echo "  unmount <device>            Unmount a device"
      echo "  mount-all                   Mount all unmounted USB devices"
      echo "  unmount-all                 Unmount all mounted USB devices"
    }

    list_devices() {
      lsblk -o NAME,LABEL,MOUNTPOINT,SIZE,FSTYPE,TYPE | grep -E "disk|part" || true
    }

    mount_device() {
      local dev="$1"
      if [ -z "$dev" ]; then
        echo "Error: No device specified." >&2
        exit 1
      fi
      echo "Mounting /dev/$dev ..."
      udisksctl mount -b /dev/"$dev"
    }

    unmount_device() {
      local dev="$1"
      if [ -z "$dev" ]; then
        echo "Error: No device specified." >&2
        exit 1
      fi
      echo "Unmounting /dev/$dev ..."
      udisksctl unmount -b /dev/"$dev"
    }

    mount_all() {
      lsblk -pn -o NAME,TYPE | awk '$2 == "part"' | while read -r dev _; do
        if ! mount | grep -q "$dev"; then
          echo "Mounting $dev ..."
          udisksctl mount -b "$dev" || true
        fi
      done
    }

    unmount_all() {
      lsblk -pn -o NAME,MOUNTPOINT,TYPE | awk '$3 == "part" && $2 != ""' | while read -r dev _ _; do
        echo "Unmounting $dev ..."
        udisksctl unmount -b "$dev" || true
      done
    }

    cmd="$1"
    shift || true

    case "$cmd" in
      list)         list_devices ;;
      mount)        mount_device "$@" ;;
      unmount)      unmount_device "$@" ;;
      mount-all)    mount_all ;;
      unmount-all)  unmount_all ;;
      help|--help|-h) print_usage ;;
      *)            echo "Unknown command: $cmd"; print_usage; exit 1 ;;
    esac
  '';
}
