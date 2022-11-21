local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local colors = {
    black =   '#263238',
    red =     '#ec5f67',
    green =   '#8bd649',
    yellow =  '#ffcc00',
    blue =    '#89ddff',
    magenta = '#82aaff',
    cyan =    '#80cbc4',
    white =   '#cdd3de',
    bright_black =   '#707880',
    bright_red =     '#ea9560',
    bright_green =   '#2c393f',
    bright_yellow =  '#37474f',
    bright_blue =    '#c9ccd3',
    bright_magenta = '#d5dbe5',
    bright_cyan =    '#ec5f67',
    bright_white =   '#ffffff',
    clear = '#00000000'
}

local theme = {}

local font = "SauceCodePro Nerd Font 10"
local bold_font = "SauceCodePro Nerd Font Bold 10"

theme.font          = font
theme.bg_normal     = colors.black
theme.bg_focus      = colors.black
theme.bg_urgent     = colors.red
theme.bg_minimize   = colors.black
theme.bg_systray    = theme.bg_normal
theme.taglist_bg_empty = colors.black
theme.taglist_bg_occupied = colors.black
theme.taglist_bg_focus = colors.bright_black

theme.fg_normal     = colors.white
theme.fg_focus      = colors.bright_white
theme.fg_urgent     = colors.bright_white
theme.fg_minimize   = colors.bright_white

theme.tasklist_font_focus = bold_font
theme.tasklist_bg_normal = colors.black

theme.useless_gap         = dpi(10)
theme.border_width        = dpi(1)
theme.border_color_normal = colors.black
theme.border_color_active = colors.blue
theme.border_color_marked = colors.green

theme.top_bar = {
    gaps = theme.useless_gap * 2,
    height = dpi(30),
    icon_margin = dpi(4)
}
theme.systray_icon_spacing = theme.top_bar.icon_margin * 2

-- Generate taglist squares:
local taglist_square_size = dpi(5)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

theme.wallpaper = "/usr/share/backgrounds/gnome/adwaita-d.webp"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = colors.red, fg = colors.bright_white }
    }
end)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
