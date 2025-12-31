{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraPackages = with pkgs; [
      gcc
      nodejs
      typescript
      typescript-language-server
      vscode-langservers-extracted
      tailwindcss-language-server
      prettierd
      cargo
      rustc
      rust-analyzer
      rustfmt
      clang-tools
      python3
      pyright
      black
      isort
      nixd
      alejandra
      marksman
      markdownlint-cli
      texlab
      tectonic
      (lua5_1.withPackages (ps: with ps; [luarocks]))
      lua-language-server
      tree-sitter
    ];
  };
}
