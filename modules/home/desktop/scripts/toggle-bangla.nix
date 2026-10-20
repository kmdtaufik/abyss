{pkgs, ...}:
pkgs.writeShellApplication {
  name = "toggle-bangla";
  runtimeInputs = with pkgs; [ fcitx5 libnotify ];
  text = ''
    current=$(fcitx5-remote -n)
    if [ "$current" = "openbangla" ]; then
      fcitx5-remote -s keyboard-us
      notify-send -u low -t 1500 -a "Input Method" -i input-keyboard "Input Method" "English (US)"
    else
      fcitx5-remote -s openbangla
      notify-send -u low -t 1500 -a "Input Method" -i input-keyboard "Input Method" "বাংলা (Avro Phonetic)"
    fi
  '';
}
