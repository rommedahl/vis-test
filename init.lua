--https://github.com/ninewise/dotfiles/blob/master/config/vis/visrc.lua
--https://git.sr.ht/~gjabell/vis-check
--https://git.sr.ht/~gjabell/vis-fix

local test = vis:action_register("test", function()
    local test_templates = {
        ["python"] = "!python -m unittest discover -s tests | less",
    }
    local test_template = test_templates[vis.win.syntax]
    if test_template then
        vis:command(string.format(test_template, vis.win.file.name))
    else
        vis:info(string.format("No tester configured for %s", vis.win.syntax))
    end
end, "tester")

vis:map(vis.modes.NORMAL, ";t", test)
