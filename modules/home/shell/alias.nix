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
      #dev aliases
      npm = "pnpm";
      npx = "pnpm dlx";
    };
    sessionVariables = {
      EDITOR = "nvim";
      PRISMA_QUERY_ENGINE_LIBRARY = "${pkgs.prisma-engines}/lib/libquery_engine.node";
      PRISMA_QUERY_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/query-engine";
      PRISMA_SCHEMA_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/schema-engine";
    };
  };
}
