local programs = {
    script_home="$HOME/.config/hypr/scripts",

    browser = "brave-origin-beta",

    terminal = "kitty",
    fileManager = "dbus-run-session thunar",
    lock = "hyprlock",
    wallpaperDaemon = "awww-daemon",
    notification = "swaync-client -t -sw",

    menu = "$HOME/.config/hypr/scripts/toggle_menu.sh",
    calc = "$HOME/.config/hypr/scripts/toggle_calc.sh",
    wallpaper = "$HOME/.config/hypr/scripts/wallpaper_refresh.sh",
    colorpicker = "$HOME/.config/hypr/scripts/toggle_colorpicker.sh",
    logout = "$HOME/.config/hypr/scripts/toggle_logout.sh",
    taskbar = "$HOME/.config/hypr/scripts/toggle_taskbar.sh",
    glyphpicker = "$HOME/.config/hypr/scripts/glyph_picker/glyph_picker.sh",
    screenshot = "$HOME/.config/hypr/scripts/toggle_screenshot.sh",
    batteryWatcher = "$HOME/.config/hypr/scripts/battery_watcher.sh",
    systemWatcher = "$HOME/.config/hypr/scripts/system_watcher.sh",
    time = "$HOME/.config/hypr/scripts/time_notification.sh",
    startup = "$HOME/.config/hypr/scripts/laptop_startup.sh",
    vol_up = "$HOME/.config/hypr/scripts/volume_up.sh",
    vol_down = "$HOME/.config/hypr/scripts/volume_down.sh",
    vol_mute = "$HOME/.config/hypr/scripts/volume_mute.sh",
    mic_mute = "$HOME/.config/hypr/scripts/mic_mute.sh",
    brightness_up = "$HOME/.config/hypr/scripts/brightness_up.sh",
    brightness_down = "$HOME/.config/hypr/scripts/brightness_down.sh",
}
return programs
