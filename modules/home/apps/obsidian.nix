{
  config,
  lib,
  pkgs,
  username,
  hostname,
  ...
}: {
  config = lib.mkIf config.modules.obsidian.enable {
    programs.obsidian = {
      enable = true;
      cli.enable = true;
    };

    home.packages = with pkgs; [
      git-crypt
      age
    ];

    systemd.user.services.obsidian-sync = {
      Unit = {
        Description = "Auto commit and push Obsidian vault";
      };
      Service = {
        Type = "oneshot";
        # CHANGE THIS to the absolute path of your actual Obsidian vault
        WorkingDirectory = "/home/${username}/notes";
        ExecStart = "${pkgs.writeShellScript "obsidian-sync" ''
          # Added libnotify so we can send desktop alerts if something breaks
          export PATH=${pkgs.git}/bin:${pkgs.openssh}/bin:${pkgs.iputils}/bin:${pkgs.libnotify}/bin:$PATH

          # 1. Check for a working internet connection
          if ! ping -c 1 -W 2 1.1.1.1 >/dev/null 2>&1; then
            exit 0
          fi

          # 2. Commit local changes first
          if [[ -n $(git status --porcelain) ]]; then
            git add .
            git commit -m "${hostname} auto-sync: $(date +'%Y-%m-%d %H:%M:%S')"
          fi

          # 3. Safely pull remote changes using rebase
          # This places your new local commits on top of any changes made on your MacBook
          git fetch origin main >/dev/null 2>&1

          if [[ -n $(git log HEAD..origin/main --oneline) ]]; then
            echo "Remote changes detected. Attempting to pull..."

            if ! git pull --rebase origin main; then
              # THE FAILSAFE: If there is a merge conflict, cancel the pull instantly
              echo "Merge conflict detected! Aborting to protect repository state."
              git rebase --abort

              # Ping your Hyprland desktop so you know it's broken
              notify-send -u critical "Obsidian Sync Failed" "Merge conflict detected. Open terminal and resolve manually."
              exit 1
            fi
          fi

          # 4. Push if we are ahead of remote
          if [[ -n $(git cherry origin/main) ]]; then
            if ! git push origin main; then
              notify-send -u critical "Obsidian Sync Failed" "Could not push to GitHub."
              exit 1
            fi
          fi
        ''}";
      };
    };

    systemd.user.timers.obsidian-sync = {
      Unit = {
        Description = "Timer for Obsidian vault auto-sync";
      };
      Timer = {
        OnBootSec = "5m";
        OnUnitActiveSec = "30m";
        Unit = "obsidian-sync.service";
      };
      Install = {
        WantedBy = ["timers.target"];
      };
    };
  };
}
