let
  username = "kdx";
  userHome = "/home/${username}";
in {
  #Abyss
  cache-dir = "$HOME/.cache/abyss";

  #Screenshot
  screenshot-folder = "$HOME/Pictures/Screenshots";
  screenshot-editor = "pinta";
  screenshot-name = "screenshot_$(date +%d%m%Y_%H%M%S).jpg";

  # User Variables
  username = "${username}";
  userHome = "${userHome}";
  hostname = "nixos";
  system = "x86_64-linux";
  #git config
  gitUsername = "MD TAUFIK KHAN";
  gitEmail = "147173391+kmdtaufikx@users.noreply.github.com";
  wallpaperDir = "${userHome}/wallpapers";
  flakeDir = "${userHome}/abyss";
  terminal = "kitty"; # This sets the terminal that is used by the hyprland terminal keybinding
  
  #wallpaper 
  wallpaper = ./current_wallpaper.png;
  clock24h = true;
  theLocale = "en_US.UTF-8";
  theKBDLayout = "us";
  theSecondKBDLayout = "de"; # Default is empty or de
  theKBDVariant = "";
  theLCVariables = "en_GB.UTF-8";
  theTimezone = "Asia/Dhaka";
  theShell = "fish"; # Possible options: bash, zsh, nushell
  theKernel = "zen"; # Possible options: default, latest, lqx, xanmod, zen
  sdl-videodriver = "wayland"; # Either x11 or wayland ONLY. Games might require x11 set here
  # For Hybrid Systems intel-nvidia

  # Nvidia Hybrid Devices
  # ONLY NEEDED FOR HYBRID
  # SYSTEMS!
  intel-bus-id = "PCI:1:0:0";
  nvidia-bus-id = "PCI:0:2:0";
}
