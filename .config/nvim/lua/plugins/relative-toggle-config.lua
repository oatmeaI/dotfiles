require("relative-toggle").setup({
	pattern = "*",
	events = {
		on = { "BufEnter", "FocusGained", "InsertLeave", "WinEnter" },
		off = { "BufLeave", "FocusLost", "InsertEnter", "WinLeave" },
	},
})
