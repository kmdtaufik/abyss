{inputs, ...}: {
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      substituters = [
        "https://hyprland.cachix.org"
        "https://nixr2.khanmdtaufik.dev" # task-master binary cache (Cloudflare R2)
        "https://niri-epireyn.cachix.org"
        "https://noctalia.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "pnixcache:udwuNE91RhF8wyMTOqcn1mr7G5hH1/QrpqjUGyZgJ88="
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
        "niri-epireyn.cachix.org-1:tlVyFN7CtsDT+ZcLPS+ekFWeT1X6X4OqvWqbBMyIzFA="
      ];
    };
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  };
}
