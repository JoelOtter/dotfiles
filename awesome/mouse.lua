local awful = require('awful')
local modkey = UserVars.modkey

awful.mouse.append_global_mousebindings({
	awful.button({ modkey }, 4, awful.tag.viewprev),
	awful.button({ modkey }, 5, awful.tag.viewnext),
})

client.connect_signal("request::default_mousebindings", function()
	awful.mouse.append_client_mousebindings({
		awful.button({ }, 1, function (c)
			c:activate { context = "mouse_click" }
		end),
		awful.button({ modkey }, 1, function (c)
			c:activate { context = "mouse_click", action = "mouse_move"  }
		end),
		awful.button({ modkey }, 3, function (c)
			c:activate { context = "mouse_click", action = "mouse_resize"}
		end),
	})
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	c:activate { context = "mouse_enter", raise = false }
end)
