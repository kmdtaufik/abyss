{pkgs,config,...}:
{
  stylix={
    targets = {
     btop.enable = true;
     bat.enable = true;
     fzf.enable = true;
     gtk={
       enable = true;
      };
    };
  };
}
