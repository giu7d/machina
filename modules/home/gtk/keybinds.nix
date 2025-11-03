{config, ...}: {
  dconf.settings = {
    "org/gnome/shell/keybindings" = {
      # Screenshot
      show-screen-recording-ui = ["<Shift><Super>r"];
      show-screenshot-ui = ["<Super>r"];
      screenshot = [];
      screenshot-window = [];

      # Toggles
      toggle-overview = ["<Control><Alt>Up"];
      toggle-application-view = ["<Shift><Control><Alt>Up"];
      toggle-message-tray = [];
      toggle-quick-settings = [];
    };

    "org/gnome/desktop/wm/keybindings" = {
      # Move Window to Monitor
      move-to-monitor-down = ["<Control><Super>Down"];
      move-to-monitor-left = ["<Control><Super>Left"];
      move-to-monitor-right = ["<Control><Super>Right"];
      move-to-monitor-up = ["<Control><Super>Up"];

      # Move Window to Workspace
      move-to-workspace-left = ["<Shift><Control>Left"];
      move-to-workspace-right = ["<Shift><Control>Right"];
      move-to-workspace-1 = [];
      move-to-workspace-down = [];
      move-to-workspace-up = [];
      move-to-workspace-last = [];

      # Switch Applications
      switch-applications = ["<Alt>Tab"];
      switch-applications-backward = ["<Shift><Alt>Tab"];

      # Switch Input
      switch-input-source = ["<Control>space"];
      switch-input-source-backward = ["<Shift><Control>space"];

      # Switch Workspace
      switch-to-workspace-left = ["<Control>Left"];
      switch-to-workspace-right = ["<Control>Right"];
      switch-to-workspace-down = [];
      switch-to-workspace-up = [];
      switch-to-workspace-last = [];
      switch-to-workspace-1 = [];

      # Other Defaults to Disable
      panel-run-dialog = [];
      show-desktop = [];
      switch-group = [];
      switch-group-backward = [];
      switch-panels = [];
      switch-panels-backward = [];
      activate-window-menu = [];
      begin-move = [];
      begin-resize = [];
      close = [];
      cycle-group = [];
      cycle-group-backward = [];
      cycle-panels = [];
      cycle-panels-backward = [];
      cycle-windows = [];
      cycle-windows-backward = [];
      maximize = [];
      minimize = [];
    };

    # Custom Keybinds
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Emote";
      binding = "<Control><Super>space";
      command = "flatpak run com.tomjwatson.Emote";
    };
  };
}
