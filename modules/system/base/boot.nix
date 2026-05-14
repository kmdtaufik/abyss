{pkgs, ...}: {
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483642;
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
