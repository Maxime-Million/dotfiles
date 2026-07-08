-- Keybindings configuration
-- See https://wiki.hypr.land/Configuring/Basics/Binds/

local mainMod = "SUPER"
local smw = hl.plugin.split_monitor_workspaces

-- Application launches
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(code))
hl.bind(mainMod .. " + SUPER_L", hl.dsp.exec_cmd("pkill -x " .. menu .. " || " .. menu))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("~/.config/hypr/scripts/wallpaper-selector.sh"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("rofimoji --selector fuzzel --files math symbols --action copy"))
hl.bind(mainMod .. " + SEMICOLON", hl.dsp.exec_cmd("rofimoji --selector fuzzel --action copy"))
hl.bind(mainMod .. " + F12", hl.dsp.exec_cmd("hyprpicker | wl-copy"))
hl.bind("XF86PowerOff", hl.dsp.exec_cmd("nohup wlogout -b 3 -m 400 >/dev/null 2>&1 &"))

-- Window controls
hl.bind("F11", hl.dsp.window.fullscreen({ fake = false }))
hl.bind("SHIFT + F11", hl.dsp.window.fullscreen({ fake = true }) )

-- Lock keys notifications
hl.bind("Caps_Lock", hl.dsp.exec_cmd("~/.config/hypr/scripts/kb-notif.sh caps >/dev/null 2>&1 &"))
hl.bind("Num_Lock", hl.dsp.exec_cmd("~/.config/hypr/scripts/kb-notif.sh num >/dev/null 2>&1 &"))

-- Window management
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + O", hl.dsp.window.set_prop({ prop = "opaque", value = "toggle" }))
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))

-- Screenshots
hl.bind("Print", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | swappy -f -"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd("grim ~/Images/$(date +'%Y-%m-%d_%Hh%Mm%Ss_screenshot.png')"))

-- Window movement
for i = 1, 4 do
    local arrowKeys = {"Left", "Right", "Up", "Down"}
    local focusdir = {"l", "r", "u", "d"}
    hl.bind(mainMod .. " + " .. arrowKeys[i], hl.dsp.focus({ direction = focusdir[i] }))
    hl.bind(mainMod .. " + SHIFT + " .. arrowKeys[i], hl.dsp.window.move({ direction = focusdir[i] }))
end

-- Workspace switching (using plugin split-workspace)
for i = 1, 5 do
    local numberKeys = {"10", "11", "12", "13", "14"}
    hl.bind(mainMod .. " + code:" .. numberKeys[i], function() return smw.workspace(i) end)
    hl.bind(mainMod .. " + SHIFT + code:" .. numberKeys[i], function() return smw.move_to_workspace(i) end)
end

-- Special workspace
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Mouse bindings
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume and brightness (with repeating)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { repeating = true })
hl.bind("XF86Launch6",     hl.dsp.exec_cmd("pactl set-source-mute 0 toggle"), { repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { repeating = true })

-- Locked bindings (audio playback)
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"), { locked = true })
