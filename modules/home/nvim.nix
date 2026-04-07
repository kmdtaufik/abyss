{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;
    withNodeJs = true;
    extraPackages = with pkgs; [
      gcc
      cargo
      rustc
      rust-analyzer
      nixd
      alejandra
      tree-sitter
      python3
      nodejs_24
      clang-tools
    ];
  };
}
