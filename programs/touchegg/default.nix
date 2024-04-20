{ pkgs, ... }:
let
  toucheggConfig = ''
    <?xml version="1.0"?>
    <touchégg>
      <settings>
        <property name="composed_gestures_time">0</property>
      </settings>

      <application name="All">
        <!-- Pinch to Zoom In -->
        <gesture type="PINCH" fingers="2" direction="IN">
          <action type="RUN_COMMAND">xdotool keydown ctrl click 4 keyup ctrl</action>
        </gesture>

        <!-- Pinch to Zoom Out -->
        <gesture type="PINCH" fingers="2" direction="OUT">
          <action type="RUN_COMMAND">xdotool keydown ctrl click 5 keyup ctrl</action>
        </gesture>

        <!-- Three finger swipe up -->
        <gesture type="SWIPE" fingers="3" direction="UP">
          <action type="RUN_COMMAND">xdotool key super+w</action>
        </gesture>

        <!-- Three finger swipe down -->
        <gesture type="SWIPE" fingers="3" direction="DOWN">
          <action type="RUN_COMMAND">xdotool key super+w</action>
        </gesture>

        <!-- Three finger swipe left -->
        <gesture type="SWIPE" fingers="3" direction="LEFT">
          <action type="RUN_COMMAND">xdotool key super+Left</action>
        </gesture>

        <!-- Three finger swipe right -->
        <gesture type="SWIPE" fingers="3" direction="RIGHT">
          <action type="RUN_COMMAND">xdotool key super+Right</action>
        </gesture>
      </application>
    </touchégg>
  '';
in
{
  home = {
    file.".config/touchegg/touchegg.conf".text = toucheggConfig;
    packages = with pkgs; [
      touchegg
    ];
  };
  # Configure a systemd user service for Touchegg
  systemd.user.services.touchegg = {
    Unit = {
      Description = "Touchégg Daemon";
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.touchegg}/bin/touchegg";
      Restart = "always";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
