-- Permissions configuration
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/

hl.config({
  ecosystem = {
    enforce_permissions = true,
  },
})


hl.permission({
  binary = "/usr/bin/grim",
  type = "screencopy",
  mode = "allow"
})

hl.permission({
  binary = "/usr/lib/xdg-desktop-portal-hyprland",
  type = "screencopy",
  mode = "allow"
})

hl.permission({
  binary = "/usr/(bin|local/bin)/hyprpm",
  type = "plugin",
  mode = "allow"
})

hl.permission({
  binary = "/usr/bin/hyprpicker",
  type = "screencopy",
  mode = "allow"
})

hl.permission({
  binary = "/usr/bin/hyprlock",
  type = "screencopy",
  mode = "allow"
})
