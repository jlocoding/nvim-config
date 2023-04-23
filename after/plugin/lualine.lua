local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local lauline_nightfly_status, lualine_nightfly = pcall(require, "lualine.themes.nightfly")
if not lauline_nightfly_status then
	return
end

lualine_nightfly.normal.a.bg = "#65D1FF"
lualine_nightfly.insert.a.bg = "#5CFF33"
lualine_nightfly.visual.a.bg = "#FF61EF"
lualine_nightfly.command = {
	a = {
		gui = "bold",
		bg = "#FFDA7B",
		fg = "#000000",
	},
}

lualine.setup({
	options = {
		theme = lualine_nightfly,
	},
})
