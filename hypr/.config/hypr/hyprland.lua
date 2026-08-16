------------------
---- MONITORS ----
------------------

hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })
hl.monitor({ output = "HDMI-A-1", mode = "3840x2560@60", position = "1920x0", scale = 1.25 })
-- hl.monitor({ output = "DVI-D-1", mode = "1920x1080@144", position = "0x0", scale = 1 })
hl.monitor({ output = "DVI-D-1", disabled = true })

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "kitty"
local fileManager = "thunar"
local menu = 'wofi --show drun --prompt="Spotlight Search"'
local timer = "~/.local/bin/wofi-timer"
local fanControl = "coolercontrol"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar & swaync & hyprpaper")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
-- hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
-- Fixes discord blurriness
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in = 0,
        gaps_out = 0,
        border_size = 2,
        col = {
            active_border = "rgba(70,10,110,1)",
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 10,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 0xee1a1a1a,
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
    animations = {
        enabled = true,
    },
})

hl.curve("easeOutQuint", { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear", { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve("almostLinear", { type = "bezier", points = { {0.5, 0.5}, {0.75, 1} } })
hl.curve("quick", { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

-- Workspace -> monitor assignment (was: workspace = N, monitor:X)
-- TODO verify: exact hl.workspace_rule field name for a static monitor assignment
hl.workspace_rule({ workspace = 1, monitor = "HDMI-A-1" })

hl.config({
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,
    },
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout = "us, pt",
        kb_variant = "",
        kb_model = "",
        kb_options = "grp:ctrl_space_toggle",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false,
        },
        numlock_by_default = true,
    },
})

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Ctrl -> Super for copy/paste/cut/undo
hl.bind(mainMod .. " + A", hl.dsp.send_shortcut({ mods = "CTRL", key = "A" }))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.send_shortcut({ mods = "CTRL+SHIFT", key = "C" }))
hl.bind(mainMod .. " + C", hl.dsp.send_shortcut({ mods = "CTRL", key = "C" }))
hl.bind(mainMod .. " + V", hl.dsp.send_shortcut({ mods = "CTRL", key = "V" }))
hl.bind(mainMod .. " + X", hl.dsp.send_shortcut({ mods = "CTRL", key = "X" }))
hl.bind(mainMod .. " + Z", hl.dsp.send_shortcut({ mods = "CTRL", key = "Z" }))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.send_shortcut({ mods = "CTRL+SHIFT", key = "Z" }))

-- Waybar
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("pkill waybar && waybar &"))

-- Core binds
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(fileManager))
hl.bind("CTRL + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + SHIFT + space", hl.dsp.exec_cmd(timer))
hl.bind(mainMod .. " + ALT + C", hl.dsp.exec_cmd(fanControl))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Screenshots
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
hl.bind("ALT + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))

-- Fullscreen
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = 0 })) 
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = 1 }))
-- Switch workspaces with mainMod + [0-9], move window with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scratchpad
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland (kept disabled, matching original commented-out rule)
-- hl.window_rule({
--     name = "fix-xwayland-drags",
--     match = {
--         class = "^$",
--         title = "^$",
--         xwayland = true,
--         float = true,
--         fullscreen = false,
--         pin = false,
--     },
--     no_focus = true,
-- })
