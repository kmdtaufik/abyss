{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.systemModules.gpu.type == "intel") {
    nixpkgs.config.packageOverrides = pkgs: {
      intel-vaapi-driver = pkgs.intel-vaapi-driver.override {
        enableHybridCodec = true;
      };
    };
    hardware.graphics = {
      extraPackages = with pkgs; [
        intel-media-driver
        intel-vaapi-driver
        libva-vdpau-driver
        libvdpau-va-gl
      ];
    };
  };
}
