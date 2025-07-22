{pkgs, ...}: {
  home = {
    shellAliases = {
      cd = "z";
      ".." = "cd ..";
      "..." = "cd ../..";
      "..3" = "cd ../../..";
      ff = "fastfetch";
      ga = "git add";
      gc = "git commit -m";
      gp = "git push";
      gpl = "git pull";
    };
  };
  programs.bash.initExtra = ''
    mount-usb() {
      udisksctl mount -b /dev/"$1"
    }
    unmount-usb() {
      udisksctl unmount -b /dev/"$1"
    }
  '';
}
