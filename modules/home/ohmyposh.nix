{
  programs.oh-my-posh = {
    enable = true;
    settings = {
      "$schema" = "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json";
      version = 3;
      patch_pwsh_bleed = true;
      final_space = true;

      palette = {
        color0 = "#1a110f";
        color1 = "";
        color2 = "";
        color3 = "";
        color4 = "";
        color5 = "";
        color6 = "";
        color7 = "";
        color8 = "";
        color9 = "";
        color10 = "#ffffff";
        color11 = "";
        color12 = "";
        color13 = "#000000";
        color14 = "";
        color15 = "#ffffff";
      };

      transient_prompt = {
        template = "  ❯❯ {{ .AbsolutePWD }} : ";
        foreground = "p:color15";
        background = "transparent";
        newline = true;
      };

      blocks = [
        {
          type = "prompt";
          alignment = "left";
          segments = [
            {
              type = "text";
              style = "plain";
              template = "\n╭─";
              foreground = "p:color15";
              properties.cache_duration = "none";
            }
            {
              type = "session";
              style = "diamond";
              template = " ";
              foreground = "p:color15";
              background = "p:color13";
              leading_diamond = "";
              properties.cache_duration = "none";
            }
            {
              type = "root";
              style = "powerline";
              template = "󱐋";
              foreground = "#ff5555";
              background = "p:color13";
              powerline_symbol = "";
              properties.cache_duration = "none";
            }
            {
              type = "os";
              style = "powerline";
              template = "{{ .Icon }}  ";
              foreground = "p:color15";
              background = "p:color13";
              powerline_symbol = "";
              properties.cache_duration = "none";
            }
            {
              type = "path";
              style = "diamond";
              template = " 󰉖 {{ path .Path .Location }}";
              foreground = "p:color13";
              background = "p:color10";
              trailing_diamond = "";
              properties = {
                cache_duration = "none";
                style = "full";
              };
            }
          ];
        }

        {
          type = "prompt";
          alignment = "right";
          segments = [
            {
              type = "git";
              style = "diamond";
              template = " ({{ url .UpstreamIcon .UpstreamURL }} {{ url .HEAD .UpstreamURL }}){{ if gt .Ahead 0 }}<#50fa7b> +{{ .Ahead }}</>{{ end }}{{ if gt .Behind 0 }}<#ff5555> -{{ .Behind }}</>{{ end }}{{ if .Working.Changed }}<p:color15>  {{ .Working.String }}</>{{ end }}{{ if .Staging.Changed }}<p:color15>  {{ .Staging.String }}</>{{ end }}";
              foreground = "p:color13";
              background = "transparent";
              properties = {
                branch_icon = "";
                cache_duration = "none";
                display_changing_color = true;
                fetch_status = true;
                fetch_upstream_icon = true;
                full_branch_path = true;
              };
            }
            {
              type = "node";
              style = "diamond";
              template = " {{ .Full }}";
              foreground = "p:color13";
            }
            {
              type = "npm";
              style = "diamond";
              template = " {{ .Full }}";
              foreground = "p:color13";
              properties = {
                display_mode = "files";
                extensions = ["package-lock.json"];
              };
            }
            {
              type = "pnpm";
              style = "diamond";
              template = "󰋁 {{ .Full }}";
              foreground = "p:color13";
              properties = {
                display_mode = "files";
                extensions = ["pnpm-lock.yaml"];
              };
            }
            {
              type = "python";
              style = "diamond";
              template = " {{ .Full }}";
              foreground = "p:color13";
              properties = {
                display_mode = "files";
              };
            }
            {
              type = "java";
              style = "diamond";
              template = " {{ .Full }}";
              foreground = "p:color13";
            }
            {
              type = "php";
              style = "diamond";
              template = " {{ .Full }}";
              foreground = "p:color15";
            }
          ];
        }

        {
          type = "prompt";
          alignment = "left";
          newline = true;
          segments = [
            {
              type = "text";
              style = "diamond";
              template = "╰─ ❯❯";
              foreground = "p:color15";
              properties = {
                always_enabled = true;
                cache_duration = "none";
              };
            }
          ];
        }
      ];
    };
  };
}
