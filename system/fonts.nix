{pkgs, ...}: {
  fonts.packages = with pkgs; [
    lohit-fonts.bengali
    noto-fonts
    corefonts
    font-awesome
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    fira-sans
    nerd-fonts.jetbrains-mono
  ];
}
