-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
-- Declarative object management
local ruled = require("ruled")

require('vars')
local colors = require('colors')
require('keyboard')
require('mouse')
require('init')

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
naughty.connect_signal("request::display_error", function(message, startup)
  naughty.notification {
    urgency = "critical",
    title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
    message = message
  }
end)
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme.lua")

-- {{{ Tag layout
-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts", function()
  awful.layout.append_default_layouts({
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.floating,
  })
end)
-- }}}

-- {{{ Wallpaper
screen.connect_signal("request::wallpaper", function(s)
  gears.wallpaper.maximized(beautiful.wallpaper, s)
end)
-- }}}

-- {{{ Wibar

-- Create a textclock widget
mytextclock = wibox.widget.textclock()

screen.connect_signal("request::desktop_decoration", function(s)
  -- Each screen has its own tag table.
  awful.tag({ "一つ", "二つ", "三つ", "四つ", "五つ" }, s, awful.layout.layouts[1])

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox {
    screen  = s,
    buttons = {
      awful.button({ }, 1, function () awful.layout.inc( 1) end),
      awful.button({ }, 3, function () awful.layout.inc(-1) end),
      awful.button({ }, 4, function () awful.layout.inc(-1) end),
      awful.button({ }, 5, function () awful.layout.inc( 1) end),
    }
  }

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = {
      awful.button({ }, 1, function(t) t:view_only() end),
      awful.button({ modkey }, 1, function(t)
                      if client.focus then
                        client.focus:move_to_tag(t)
                      end
                    end),
      awful.button({ }, 3, awful.tag.viewtoggle),
      awful.button({ modkey }, 3, function(t)
                      if client.focus then
                        client.focus:toggle_tag(t)
                      end
                    end),
      awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
      awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
    }
  }

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.currenttags,
    layout = {
      layout = wibox.layout.flex.horizontal,
      spacing = beautiful.top_bar.gaps,
    },
    buttons = {
      awful.button({ }, 1, function (c)
        c:activate { context = "tasklist", action = "toggle_minimization" }
      end),
      awful.button({ }, 4, function() awful.client.focus.byidx(-1) end),
      awful.button({ }, 5, function() awful.client.focus.byidx( 1) end),
    },
    widget_template = {
      {
        {
          {
            {
              id   = 'icon_role',
              widget = wibox.widget.imagebox,
            },
            margins = beautiful.top_bar.icon_margin,
            widget  = wibox.container.margin,
          },
          {
            id   = 'text_role',
            widget = wibox.widget.textbox,
          },
          layout = wibox.layout.fixed.horizontal,
        },
        widget = wibox.container.margin
      },
      id   = 'background_role',
      widget = wibox.container.background,
    }
  }

  s.mysystray = wibox.container.margin(
    wibox.widget.systray(),
    beautiful.top_bar.icon_margin,
    beautiful.top_bar.icon_margin,
    beautiful.top_bar.icon_margin,
    beautiful.top_bar.icon_margin
  )

  -- Create the wibox
  s.mywibox = awful.wibar {
    position = "top",
    screen   = s,
    margins = {
      top = beautiful.top_bar.gaps,
      left = beautiful.top_bar.gaps,
      right = beautiful.top_bar.gaps,
    },
    height = beautiful.top_bar.height,
    widget = {
						layout = wibox.layout.align.horizontal,
      expand = "none",
      spacing = beautiful.top_bar.gaps,
      { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        s.mytaglist,
        s.mypromptbox,
      },
      s.mytasklist,
      { -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        s.mysystray,
        mytextclock,
        s.mylayoutbox,
      },
    }
  }

  s.volume_container = awful.popup {
    ontop = true,
    stretch = false,
    visible = false,
    border_color = colors.magenta,
    border_width = 1,
    screen = s,
    layout = wibox.layout.fixed.horizontal,
    placement = function(c) awful.placement.centered(c, { margins = { top = beautiful.top_bar.height * 10 } }) end,
    widget = {
      id = "value",
      text = "\n This is a volume thing \n",
      align = "center",
      valign = "center",
      font = beautiful.bold_font,
      widget = wibox.widget.textbox
    }
  }
end)

-- }}}



-- }}}

-- {{{ Rules
-- Rules to apply to new clients.
ruled.client.connect_signal("request::rules", function()
  -- All clients will match this rule.
  ruled.client.append_rule {
    id     = "global",
    rule     = { },
    properties = {
      focus   = awful.client.focus.filter,
      raise   = true,
      screen  = awful.screen.preferred,
      placement = awful.placement.no_overlap+awful.placement.no_offscreen
    }
  }

  -- Floating clients.
  ruled.client.append_rule {
    id     = "floating",
    rule_any = {
      instance = { "copyq", "pinentry" },
      class  = {
        "Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv",
        "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer"
      },
      -- Note that the name property shown in xprop might be set slightly after creation of the client
      -- and the name shown there might not match defined rules here.
      name  = {
        "Event Tester",  -- xev.
      },
      role  = {
        "AlarmWindow",  -- Thunderbird's calendar.
        "ConfigManager",  -- Thunderbird's about:config.
        "pop-up",     -- e.g. Google Chrome's (detached) Developer Tools.
      }
    },
    properties = { floating = true }
  }

  -- Add titlebars to dialogs but not normal
  ruled.client.append_rule {
    id     = "titlebars",
    rule_any   = { type = { "dialog" } },
    properties = { titlebars_enabled = true }
  }
  ruled.client.append_rule {
    id     = "titlebars",
    rule_any   = { type = { "normal" } },
    properties = { titlebars_enabled = false }
  }

  -- Set Firefox to always map on the tag named "2" on screen 1.
  -- ruled.client.append_rule {
  --   rule     = { class = "Firefox"   },
  --   properties = { screen = 1, tag = "2" }
  -- }
end)
-- }}}

-- {{{ Titlebars
-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
  -- buttons for the titlebar
  local buttons = {
    awful.button({ }, 1, function()
      c:activate { context = "titlebar", action = "mouse_move"  }
    end),
    awful.button({ }, 3, function()
      c:activate { context = "titlebar", action = "mouse_resize"}
    end),
  }

  awful.titlebar(c).widget = {
    { -- Left
      awful.titlebar.widget.iconwidget(c),
      buttons = buttons,
      layout  = wibox.layout.fixed.horizontal
    },
    { -- Middle
      { -- Title
        halign = "center",
        widget = awful.titlebar.widget.titlewidget(c)
      },
      buttons = buttons,
      layout  = wibox.layout.flex.horizontal
    },
    { -- Right
      awful.titlebar.widget.floatingbutton (c),
      awful.titlebar.widget.maximizedbutton(c),
      awful.titlebar.widget.stickybutton   (c),
      awful.titlebar.widget.ontopbutton  (c),
      awful.titlebar.widget.closebutton  (c),
      layout = wibox.layout.fixed.horizontal()
    },
    layout = wibox.layout.align.horizontal
  }
end)
-- }}}

-- {{{ Notifications

ruled.notification.connect_signal('request::rules', function()
  -- All notifications will match this rule.
  ruled.notification.append_rule {
    rule     = { },
    properties = {
      screen       = awful.screen.preferred,
      implicit_timeout = 5,
    }
  }
end)

naughty.connect_signal("request::display", function(n)
  naughty.layout.box { notification = n }
end)
