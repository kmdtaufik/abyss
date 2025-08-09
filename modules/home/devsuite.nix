{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.devsuite.homeManagerModules.devsuite
  ];

  programs.devsuite = {
    enable = true;
    vscode.enable = true;
    idea.ultimate.enable = false;
    pycharm.professional.enable = false;
    dependencies = with pkgs; [
      pnpm
      nodejs
      openjdk
      python3
      #lazyvim dependencies
      fzf
      ripgrep
      gcc
      fd
      lazygit
      nixd
      alejandra
      cargo
    ];
  };
}
