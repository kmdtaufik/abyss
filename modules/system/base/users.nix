{ pkgs, username, ... }: 
let
  inherit (import ../../../settings.nix) gitUsername theShell;
in
{
  users.mutableUsers = true;
  users.users."${username}" = {
    homeMode = "755";
    isNormalUser = true;
    description = "${gitUsername}";
    extraGroups = [
      "networkmanager"
      "wheel"
      "adbusers"
      "libvirtd"
      "kvm"
      "dialout"
      "uucp"
    ];
    shell = pkgs."${theShell}";
    ignoreShellProgramCheck = true;
  };
}
