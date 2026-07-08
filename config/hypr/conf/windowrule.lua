-- Window rules configuration
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

hl.window_rule({
    name  = "all-maximize",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "teams-for-linux",
    match = { class = "^(teams-for-linux)$" },
    workspace = "unset",
})

hl.window_rule({
    name  = "raffi",
    match = { class = "^(com.chmouel.raffi)$" },
    opaque = true,
    no_blur = true,
    float = true,
})

hl.window_rule({
    name  = "chitubox",
    match = { class = "^(CHITUBOX_Basic)$" },
    opaque = true,
    no_blur = true,
    opacity = "1.0 override 1.0 override",
})

hl.window_rule({
    name  = "roblox",
    match = { class = "^(org.vinegarhq.Sober)$" },
    fullscreen = true,
    opaque = true,
    no_blur = true,
    opacity = "1.0 override 1.0 override",
})

hl.window_rule({
    name  = "minecraft-launcher downloader",
    match = { class = "^(minecraft-launcher)$" },
    float = true,
    opaque = true,
    no_blur = true,
    opacity = "1.0 override 1.0 override",
})

hl.window_rule({
    name  = "freecad",
    match = { class = "^(org.freecad.FreeCAD)$" },
    opaque = true,
    no_blur = true,
    opacity = "1.0 override 1.0 override",
})

hl.window_rule({
    name  = "crealityprint",
    match = { class = "^(Creality Print)$" },
    opaque = true,
    no_blur = true,
    opacity = "1.0 override 1.0 override",
})

hl.window_rule({
    name  = "ags_bar",
    match = { class = "^(my-bar)$" },
    opaque = true,
})

hl.window_rule({
    name  = "mpv_ani_cli",
    match = { class = "^(mpv)$" },
    opaque = true,
    no_blur = true,
    opacity = "1.0 override 1.0 override",
})

hl.window_rule({
    name  = "org.gnome.baobab",
    match = { class = "^(org.gnome.baobab)$" },
    float = true,
    size = {"900", "600"},
    center = true,
    opacity = "1.0 override 1.0 override",
    opaque = true,
    no_blur = true,
})

hl.window_rule({
    name  = "eww-panel-0",
    match = { class = "^(eww-panel-window-0)$" },
    rounding = 12,
})

hl.window_rule({
    name  = "eww-panel-1",
    match = { class = "^(eww-panel-window-1)$" },
    rounding = 12,
})

hl.window_rule({
    name  = "zen",
    match = { class = "^(zen)$" },
    opacity = "1.0 override 1.0 override",
    no_blur = true,
    opaque = true,
})

hl.window_rule({
    name  = "zen-fullscreen",
    match = { class = "^(zen)$", fullscreen = true },
    opacity = "1.0 override 1.0 override",
    no_blur = true,
    opaque = true,
})

hl.window_rule({
    name  = "code",
    match = { class = "^(code)$" },
    opacity = "1.0 override 1.0 override",
    no_blur = true,
})

hl.window_rule({
    name  = "vlc",
    match = { class = "^(vlc)$" },
    opacity = "1.0 override 1.0 override",
    no_blur = true,
})

hl.window_rule({
    name  = "vlc-fullscreen",
    match = { class = "^(vlc)$", fullscreen = true },
    opacity = "1.0 override 1.0 override",
    opaque = true,
})

hl.window_rule({
    name  = "steam",
    match = { class = "^(steam)$" },
    opacity = "1.0 override 1.0 override",
    opaque = true,
})

hl.window_rule({
    name  = "steam-fullscreen",
    match = { class = "^(steam)$", fullscreen = true },
    opacity = "1.0 override 1.0 override",
    opaque = true,
})

hl.window_rule({
    name  = "minecraft",
    match = { class = "^(Minecraft Launcher)$" },
    opacity = "1.0 override 1.0 override",
    opaque = true,
})

hl.window_rule({
    name  = "minecraft-fullscreen",
    match = { class = "^(Minecraft Launcher)$", fullscreen = true },
    opacity = "1.0 override 1.0 override",
    opaque = true,
})

hl.window_rule({
    name  = "pavucontrol",
    match = { class = "org.pulseaudio.pavucontrol" },
    float = true,
    size = {"1200","600"},
})

hl.window_rule({
    name  = "blueman",
    match = { class = "blueman-manager" },
    float = true,
    size = {"400","600"},
})

hl.window_rule({
    name  = "xwayland-drag-fix",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})
