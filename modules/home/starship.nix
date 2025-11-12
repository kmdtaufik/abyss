{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.starship = {
    enable = true;
    settings = {
      "$schema" = "https://starship.rs/config-schema.json";

      palette = "tokyonight_moon";

      palettes.tokyonight_moon = {
        foreground = "#c0caf5"; 
        comment = "#565f89";  
        selection = "#2e3c64";  

        red = "#f7768e";       
        orange = "#ff9e64";    
        yellow = "#e0af68";    
        green = "#9ece6a";     
        purple = "#9d7cd8";    
        cyan = "#7dcfff";      
        pink = "#bb9af7";      
      };

      directory = {
        style = " bold cyan";
        truncate_to_repo = true;
        truncation_length = 0;
        # truncation_symbol = " ";
        read_only = "";
      };

      git_metrics = {
        disabled = false;
        added_style = "bold green";
        format = "[+$added]($added_style)/[-$deleted]($deleted_style) ";
      };

      sudo.disabled = false;
      sudo.style = "bold red";
      git_status = {
        ahead = "\${count}";
        behind = "\${count}";
        deleted = "x(red)";
        diverged = "\${ahead_count}\${behind_count}";
        style = "foreground";
        conflicted = "[≠](red)";
        untracked = "[?](yellow)";
        modified = "[~](orange)";
      };

      git_branch = {
        symbol = " ";
        style = "bold purple";
      };

      nix_shell = {
        format = "via [$symbol(($name))]($style) ";
        symbol = " ";
      };

      cmd_duration = {
        disabled = false;
        style = "bold orange";
        format = "took [$duration]($style)";
        show_milliseconds = true;
        show_notifications = true;
        min_time_to_notify = 30000;
      };

      battery = {
        charging_symbol = "";
        disabled = true;
        discharging_symbol = "";
        full_symbol = "";
        display = [
          {
            disabled = false;
            style = "bold red";
            threshold = 15;
          }
          {
            disabled = true;
            style = "bold orange";
            threshold = 50;
          }
          {
            disabled = true;
            style = "bold green";
            threshold = 90;
          }
        ];
      };

      status = {
        disabled = false;
        format = "[\[$symbol$status_common_meaning$status_signal_name$status_maybe_int\]]($style)";
        map_symbol = true;
        pipestatus = true;
        symbol = "✖";
        not_executable_symbol = "";
        not_found_symbol = "";
        sigint_symbol = "󰟾";
        signal_symbol = "";
      };

      os = {
        disabled = true;
        format = " [$symbol]($style)";
        style = "bold pink";
        symbols = {
          Alpaquita = " ";
          Alpine = " ";
          AlmaLinux = " ";
          Amazon = " ";
          Android = " ";
          Arch = " ";
          Artix = " ";
          CentOS = " ";
          Debian = " ";
          DragonFly = " ";
          Emscripten = " ";
          EndeavourOS = " ";
          Fedora = " ";
          FreeBSD = " ";
          Garuda = "󰛓 ";
          Gentoo = " ";
          HardenedBSD = "󰞌 ";
          Illumos = "󰈸 ";
          Kali = " ";
          Linux = " ";
          Mabox = " ";
          Macos = " ";
          Manjaro = " ";
          Mariner = " ";
          MidnightBSD = " ";
          Mint = " ";
          NetBSD = " ";
          NixOS = " ";
          OpenBSD = "󰈺 ";
          openSUSE = " ";
          OracleLinux = "󰌷 ";
          Pop = " ";
          Raspbian = " ";
          Redhat = " ";
          RedHatEnterprise = " ";
          RockyLinux = " ";
          Redox = "󰀘 ";
          Solus = "󰠳 ";
          SUSE = " ";
          Ubuntu = " ";
          Unknown = " ";
          Void = " ";
          Windows = "󰍲 ";
        };
      };

      character = {
        success_symbol = "❯(bold green)";
        error_symbol ="(bold red)";
        vimcmd_symbol= "V(bold purple)";
      };

      git_commit.tag_symbol = "  ";
      golang.symbol = " ";
      guix_shell.symbol = " ";
      haskell.symbol = " ";
      haxe.symbol = " ";
      hg_branch.symbol = " ";
      java.symbol = " ";
      julia.symbol = " ";
      kotlin.symbol = " ";
      lua.symbol = " ";
      memory_usage.symbol = "󰍛 ";
      meson.symbol = "󰔷 ";
      nim.symbol = "󰆥 ";
      nodejs.symbol = " ";
      ocaml.symbol = " ";
      package.symbol = "󰏗 ";
      perl.symbol = " ";
      php.symbol = " ";
      pijul_channel.symbol = " ";
      python.symbol = " ";
      rlang.symbol = "󰟔 ";
      ruby.symbol = " ";
      rust.symbol = "󱘗 ";
      scala.symbol = " ";
      swift.symbol = " ";
      zig.symbol = " ";
      gradle.symbol = " ";
    };
  };
}
