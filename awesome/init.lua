terminal = UserVars.terminal
editor = os.getenv("EDITOR") or UserVars.editor
editor_cmd = terminal .. " -e " .. editor
modkey = UserVars.modkey
