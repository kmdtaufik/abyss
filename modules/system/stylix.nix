{pkgs, ...}: let
  inherit (import ../../settings.nix) wallpaper;
in {
  stylix = {
    enable = true;
    autoEnable = false;
    base16Scheme = {
      scheme = "Aurora Midnight";
      slug = "aurora-midnight";
      author = "Gemini (Math-Generated)";

      # THE POLAR NIGHT (Backgrounds)
      # Hue: 210 (Deep Cold Blue/Teal mix)
      base00 = "03090e"; # Absolute Void (Darker than before)
      base01 = "0b141f"; # Dark Ice
      base02 = "142232"; # Deep Water
      base03 = "253850"; # Frozen Steel
      base04 = "39506d"; # Muted Cobalt

      # THE FROST (Foregrounds)
      # We use a very cold, blue-tinted white.
      base05 = "eefeff"; # Glacial White (Main Text)
      base06 = "cceeff"; # Ice Mist
      base07 = "ffffff"; # Pure White (Highlights)

      # THE AURORA (Accents)
      # We replaced the "Brick Red" with "Radical Red"
      base08 = "ff2a6d"; # Neon Red/Pink (New Warning Color)
      base09 = "ff8800"; # Plasma Orange
      base0A = "ffcc00"; # High-Voltage Yellow
      base0B = "05ffa1"; # Kryptonite Green (Cold Green)
      base0C = "00ffff"; # Cyan Laser (The Hero Color)
      base0D = "00aeff"; # Electric Blue
      base0E = "b700ff"; # Ultraviolet
      base0F = "ff00cc"; # Hot Fuchsia
    };
  };
}
