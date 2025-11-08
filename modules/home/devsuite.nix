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
      #lazyvim dependencies
      fzf
      ripgrep
      gcc
      fd
      lazygit
      nixd
     
    ];
  };
}
