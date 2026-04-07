let
  inherit (import ../../settings.nix) gitUsername gitEmail;
in  ;{
  programs.git = {
    enable = true;
    userEmail =${gitEmail} ;
    userName =${gitUsername} ;
    
  };
}
