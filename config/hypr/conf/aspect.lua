-- Look and feel configuration
-- See https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10,
        border_size = 1,
        col = {
            active_border   = {
                colors = {"rgba(33ccffee)", "rgba(00ff99ee)"},
                angle = 45,
            },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding       = 10,
        rounding_power = 2,
        active_opacity   = 0.9,
        inactive_opacity = 0.8,
        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = "rgba(1a1a1aee)",
        },
        blur = {
            enabled   = false,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
})

-- Animation curves
hl.curve("winIn",      { type = "bezier", points = { {0.1, 1.1},    {0.1, 1.1}    } })
hl.curve("winOut",     { type = "bezier", points = { {0.3, -0.3},   {0, 1}        } })
hl.curve("wind",       { type = "bezier", points = { {0.05, 0.9},   {0.1, 1.05}   } })
hl.curve("liner",      { type = "bezier", points = { {1, 1},        {1, 1}        } })
hl.curve("menu_decel", { type = "bezier", points = { {0.1, 1},      {0, 1}        } })
hl.curve("menu_accel", { type = "bezier", points = { {0.38, 0.04},  {1, 0.07}     } })
hl.curve("md3_decel",  { type = "bezier", points = { {0.05, 0.7},   {0.1, 1}      } })

-- Animations
hl.animation({ leaf = "windows",          enabled = true,  speed = 6,   bezier = "wind" , style = "slide" })
hl.animation({ leaf = "windowsIn",        enabled = true,  speed = 6,   bezier = "winIn", style = "slide" })
hl.animation({ leaf = "windowsOut",       enabled = true,  speed = 5,   bezier = "winOut", style = "slide" })
hl.animation({ leaf = "windowsMove",      enabled = true,  speed = 5,   bezier = "wind", style = "slide" })
hl.animation({ leaf = "border",           enabled = true,  speed = 1,   bezier = "liner" })
hl.animation({ leaf = "borderangle",      enabled = true,  speed = 30,  bezier = "liner", style = "loop" })
hl.animation({ leaf = "fade",             enabled = true,  speed = 10,  bezier = "default" })
hl.animation({ leaf = "layersIn",         enabled = true,  speed = 3,   bezier = "menu_decel", style = "slide" })
hl.animation({ leaf = "layersOut",        enabled = true,  speed = 1.6, bezier = "menu_accel" })
hl.animation({ leaf = "fadeLayersIn",     enabled = true,  speed = 2,   bezier = "menu_decel" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true,  speed = 0.5, bezier = "menu_accel" })
hl.animation({ leaf = "workspaces",       enabled = true,  speed = 5,   bezier = "wind" })
hl.animation({ leaf = "specialWorkspace", enabled = true,  speed = 3.4, bezier = "md3_decel", style = "slidevert" })
