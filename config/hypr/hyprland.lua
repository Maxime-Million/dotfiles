-- Hyprland main configuration file
-- See https://wiki.hypr.land/Configuring/Start/

local config_dir = "/home/maxime/.config/hypr"
package.path = package.path .. ";" .. config_dir .. "/?.lua;" .. config_dir .. "/?/init.lua"

require("plugins.split_monitor_workspaces")
require("plugins.dynamic_cursors")

require("conf.my_programs")
require("conf.environment_var")
require("conf.permissions")
require("conf.aspect")
require("conf.input")
require("conf.keybindings")
require("conf.windowrule")
require("conf.monitors")
require("conf.auto_start")

require("monitors")
