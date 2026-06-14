local programs = require("modules/programs")

local autostart = {
  hl.on("hyprland.start", function () 
    hl.exec_cmd("echo 0 | sudo tee /sys/class/leds/platform::micmute/brightness")
    hl.exec_cmd("hyprshell run")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprpm enable dynamic-cursors")
    hl.exec_cmd("hyprpm enable hyprexpo")
    hl.exec_cmd(programs.wallpaperDaemon)
    hl.exec_cmd(programs.wallpaper)
--    hl.exec_cmd(programs.taskbar)
    hl.exec_cmd(programs.batteryWatcher)
    hl.exec_cmd(programs.systemWatcher)
    hl.exec_cmd(programs.startup)
    end)
}

return autostart
