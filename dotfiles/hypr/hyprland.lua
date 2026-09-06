------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output = "eDP-1",
    mode = "1920x1080@60",
    position = "auto",
    scale = 1,
})

hl.monitor({
    output = "DP-3",
    mode = "1024x768@60",
    position = "auto-left",
    scale = 1,
    reserved = {0,540,0,0},
})
hl.workspace_rule({
        workspace = "10",
        monitor = "DP-3"
})

--os.execute("hyprctl keyword monitor DP-3,addreserved,0,540,0,0")

---------------------
---- MY PROGRAMS ----
---------------------

-- See https://wiki.hypr.land/Configuring/Basics/Binds/

-- Set programs that you use
local terminal = "kitty"
local fileManager = "nautilus"


-------------------
---- AUTOSTART ----
-------------------

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function()
    -- hl.exec_cmd("~/.config/hypr/toggle-dock")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("awww img /home/jsno/Pictures/wallpaper2.jpg")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprsunset -t 2400")
    hl.exec_cmd("dunst")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
--
    hl.exec_cmd("Telegram -startintray")
--    hl.exec_cmd("qs -p /etc/xdg/quickshell/noctalia-shell");
    hl.exec_cmd("hyprctl plugin load /usr/lib/gloview.so")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-----------------------
----- PERMISSIONS -----
-----------------------

-----------------------
---- LOOK AND FEEL ----
-----------------------

local col1 = "rgb(50769B)"
local col2 = "rgb(3B4652)" 

hl.config({
    misc = {
        disable_hyprland_logo = true,
    },
})

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/

-- https://wiki.hypr.land/Configuring/Basics/Variables/#general
hl.config({
    general = {
        gaps_in = 4,
        gaps_out = 0,

        border_size = 3,

        -- https://wiki.hypr.land/Configuring/Basics/Variables/ for info about colors
        col = {
            active_border = col1,
            inactive_border = col2,
        },

        -- Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },
})

hl.config({
    cursor = {
        no_warps = true,
    },
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
hl.config({
    decoration = {
        rounding = 1,
        rounding_power = 1,

        -- Change transparency of focused and unfocused windows
        active_opacity = 1.0,
        inactive_opacity = 0.9995,

        shadow = {
            enabled = true,
            range = 3,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },

        -- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Blur/
        blur = {
            enabled = true,
            size = 6,
            passes = 2,

            vibrancy = 0.1696,
        },
    },
})


hl.config({
    animations = {
        enabled = true,
    },
})

hl.config({
    layerrule = {
        "blur, waybar",
        "ignorezero, waybar"
    },
})

hl.config({
    plugin = {
        gloview = {
            layout         = "row",
            gap            = 10,
            padding        = 80,
            padding_top    = 40,
            padding_bottom = 70,
            max_scale      = 1.2,
            preview_filter = "box4",
            duration       = 200,
            preview_round  = 1,
            blur           = 1,
            switch_animation = 1,
            switch_duration  = 260,
            move_animation   = 1,
            move_duration    = 240,
            anchor           = "bottom",
            strip_offset     = 0,
            strip_height     = 50,
            strip_margin     = 10,
            strip_gap        = 18,
            strip_card_round = 10,
            focus_follows_mouse       = 1,
            scroll_switches_workspace = 1,
            passthrough_keys          = 1,
            exit_on_click             = 1,
            exit_on_switch            = 0,
            key_close     = "escape",
            key_next_workspace = "super+right",
            key_prev_workspace = "super+left",
            key_activate  = "enter",
            key_close_window = "",
            key_left      = "left",
            key_right     = "right",
            key_up        = "up",
            key_down      = "down",
            key_desktop   = "shift",
            key_all_workspaces = "a",
            key_workspace = "super+1,super+2,super+3,super+4,super+5,super+6,super+7,super+8,super+9,super+0",
            show_all_workspaces     = 0,
            show_empty              = 0,
            dynamic_workspaces      = 1,
            autodelete_empty        = 1,
            show_workspace_labels   = 0,
            show_window_labels      = 1,
            show_special            = 0,
            strip_all_card          = 1,
            drag_to_swap            = 1,
            switch_on_drop          = 0,
            switch_on_new_workspace = 1,
            hide_top_layers     = 0,
            hide_overlay_layers = 0,
            above_namespaces    = "",
            debug_logs = 0,
            select_border_size  = 1,
            select_border       = 0x0000eeee,
            close_button_color  = 0xe6e23b3b,
            backdrop_color      = 0x73070a10,
            strip_band_color    = 0x24ffffff,
            strip_card_color    = 0x3a0e131c,
            strip_active_color  = 0x4d1c2c44,
            strip_active_border = 0xf0ffffff,
            strip_hover_border  = 0x80ffffff,
            strip_active_border_size = 2,
            strip_hover_border_size  = 2,
            strip_plus_color    = 0xd0eef4ff,
            preview_bg          = 0xff14181f,
            shadow_color        = 0x70000000,
            hover_border        = 0xf0ffffff,
            hover_border_size   = 3,
        },
    },
})

-- Animation curves

hl.curve("linear", { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve("md3_standard", { type = "bezier", points = { {0.2, 0}, {0, 1} } })
hl.curve("md3_decel", { type = "bezier", points = { {0.05, 0.7}, {0.1, 1} } })
hl.curve("md3_accel", { type = "bezier", points = { {0.3, 0}, {0.8, 0.15} } })
hl.curve("overshot", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.1} } })
hl.curve("crazyshot", { type = "bezier", points = { {0.1, 1.5}, {0.76, 0.92} } })
hl.curve("hyprnostretch", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.0} } })
hl.curve("fluent_decel", { type = "bezier", points = { {0.1, 1}, {0, 1} } })
hl.curve("easeInOutCirc", { type = "bezier", points = { {0.85, 0}, {0.15, 1} } })
hl.curve("easeOutCirc", { type = "bezier", points = { {0, 0.55}, {0.45, 1} } })
hl.curve("easeOutExpo", { type = "bezier", points = { {0.16, 1}, {0.3, 1} } })
-- Animation configs
hl.animation({ leaf = "windows", enabled = true, speed = 2, bezier = "md3_decel", style = "slide" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 2.5, bezier = "md3_decel" })
-- hl.animation({ leaf = "workspaces", enabled = true, speed = 3.5, bezier = "md3_decel", style = "slide" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3.5, bezier = "easeOutExpo", style = "slide" })
-- hl.animation({ leaf = "workspaces", enabled = true, speed = 7, bezier = "fluent_decel", style = "slidefade 15%" })
-- hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "md3_decel", style = "slidefadevert 15%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 5, bezier = "md3_decel", style = "slidevert" })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#misc
hl.config({
    misc = {
        force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


---------------
---- INPUT ----
---------------

-- https://wiki.hypr.land/Configuring/Basics/Variables/#input
hl.config({
    input = {
        kb_layout = "us,ru",
        kb_variant = "",
        kb_model = "",
        kb_options = "grp:win_space_toggle",
        kb_rules = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})


---------------------
---- KEYBINDINGS ----
---------------------

-- See https://wiki.hypr.land/Configuring/Basics/Binds/
local mainMod = "SUPER" -- Sets "Windows" key as main modifier
-- Example Hyprland bind that keeps working inside the submap:
hl.bind("Print", hl.dsp.exec_cmd("flameshot gui"))
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd("pkill waybar ; pkill hyprsunset ; pkill dunst ; pkill awww-daemon ; waybar & hyprsunset -t 2400 & dunst & awww-daemon"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("pkill wofi || wofi -W 200 -H 600 -S run"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind("ALT + F4", hl.dsp.window.close())
hl.bind("SHIFT + ALT + F4", hl.dsp.window.kill())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd('pkill wofi || wofi -W 200 -H 600 --show drun --prompt "Apps"'))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo()) --dwindle
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("pkill wofi || ~/.config/waybar/scripts/power-btn.sh"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd('pkill wofi || cliphist list | wofi --dmenu -H 800 --prompt "Search in cliphistory" | cliphist decode | wl-copy'))

--hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd('pkill wofi || wofi --dmenu -H 800 --prompt "Download from youtube" || kitty yt-dlp'))
--hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd('pkill wofi || wofi --dmenu -H 800 --prompt "Download from youtube" || kitty -- bash -c "read -r url && yt-dlp \\"$url\\""'))

hl.bind("ALT+TAB", hl.plugin.gloview.toggle)

-- resize
hl.bind("SUPER + SHIFT + ALT + right",
    hl.dsp.window.resize({ x = 50, y = 0, relative = true }),
    { repeating = true })

hl.bind("SUPER + SHIFT + ALT + left",
    hl.dsp.window.resize({ x = -50, y = 0, relative = true }),
    { repeating = true })

hl.bind("SUPER + SHIFT + ALT + up",
    hl.dsp.window.resize({ x = 0, y = -50, relative = true }),
    { repeating = true })

hl.bind("SUPER + SHIFT + ALT + down",
    hl.dsp.window.resize({ x = 0, y = 50, relative = true }),
    { repeating = true })
-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))
-- Switch workspaces with mainMod + [0-9]
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))
-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
-- Laptop multimedia keys for volume and LCD brightness
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("~/.config/hypr/changevol up"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("~/.config/hypr/changevol down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("~/.config/hypr/changevol mute"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("~/.config/hypr/changebrt up"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("~/.config/hypr/changebrt down"), { locked = true, repeating = true })
-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("CTRL + SUPER + F24", hl.dsp.exec_cmd("~/.config/hypr/touchpad-toggle.sh"))
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprlock & systemctl suspend"), { locked = true })
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock & systemctl suspend"))

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },

    no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
    name = "move-hyprland-run",

    match = { class = "hyprland-run" },

    move = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name = "tlauncher",
    match = {class = "org-tlauncher-tlauncher-rmo-TLauncher"},

    float = true,
})

windowrulev2 = {
    "noanim, fullscreen:1",
    "noblur, fullscreen:1",
    "noshadow, fullscreen:1",
    "rounding 0, fullscreen:1",
    "immediate, fullscreen:1",
}
