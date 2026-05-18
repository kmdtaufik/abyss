{
  config,
  lib,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf (config.systemModules.cpu.type == "intel") {
      hardware.cpu.intel.updateMicrocode = true;
    })
    (lib.mkIf (config.systemModules.cpu.type == "amd") {
      hardware.cpu.amd.updateMicrocode = true;
    })
    {
      services.auto-cpufreq.enable = true;
    }
  ];
}
