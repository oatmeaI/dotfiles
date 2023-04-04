local command_center = require("command_center")

command_center.add({
	{
		category = "Text Objects",
		desc = "Change CamelCase segment",
		cmd = "cav",
		keys = {
			{ "n", "cav" },
		},
	},
	{
		category = "Pets",
		desc = "New random pet",
		cmd = ":PetsNew {name}",
	},
	{
		category = "Pets",
		desc = "Toggle all hidden",
		cmd = ":PetsHideToggle<cr>",
	},
	{
		category = "Pets",
		desc = "Remove pet",
		cmd = ":PetsRemove {name}",
	},
	{
		category = "Pets",
		desc = "Remove all pets",
		cmd = ":PetsRemoveAll<cr>",
	},
	{
		category = "Pets",
		desc = "List all pets",
		cmd = ":PetsList<cr>",
	},
	{
		category = "Pets",
		desc = "New custom pet",
		cmd = ":PetsNewCustom {type} {style} {name}",
	},
	{
		category = "Jump",
		desc = "Jump backward",
		cmd = "<c-o>",
		keys = {
			{ "n", "<c-o>" },
		},
	},
	{
		category = "Application",
		desc = "PackerSync",
		cmd = ":PackerSync<cr>",
	},
	{
		category = "Editor",
		desc = "Increment / Toggle",
		cmd = "<c-a>",
		keys = {
			{ "n", "<c-a>" },
		},
	},
	{
		category = "Editor",
		desc = "Decrement / Toggle",
		cmd = "<c-x>",
		keys = {
			{ "n", "<c-x>" },
		},
	},
	{
		category = "Telescope",
		desc = "Treesitter",
		cmd = ":Telescope treesitter<cr>",
	},
	{
		category = "Git",
		desc = "Conflicts: List Git conflicts",
		cmd = ":GitConflictListQf<cr>",
	},
	{
		category = "Sessions",
		desc = "List sessions",
		cmd = ":Ls",
	},
	{
		category = "Sessions",
		desc = "Make session",
		cmd = ":Ms",
	},
	{
		category = "Editor",
		desc = "Generate screenshot",
		cmd = ":Silicon<cr>",
	},
	{
		category = "Application",
		desc = "Close all other buffers",
		cmd = ":%bd|e#|bd#<cr>",
	},
	{
		category = "Editor",
		desc = "Toggle folding",
		cmd = "zi",
		keys = {
			{ "n", "zi" },
		},
	},
	{
		category = "Editor",
		desc = "Write without formatting",
		cmd = ":noa w",
	},
	{
		category = "Editor",
		desc = "Go to args for current function",
		cmd = "[q",
		keys = {
			{ "n", "[q" },
		},
	},
	{
		category = "Window",
		desc = "Equalize splits",
		cmd = "<c-w>=",
		keys = {
			{ "n", "<c-w> =" },
		},
	},
	{
		category = "Editor",
		desc = "Autocomplete: Show autocomplete list",
		cmd = "<c-space>",
		keys = {
			{ "i", "<c-space>" },
		},
	},
	{
		category = "Editor",
		desc = "Autocomplete: Close autocomplete list",
		cmd = "<c-e>",
		keys = {
			{ "i", "<c-e>" },
		},
	},
	{
		category = "Editor",
		desc = "Autocomplete: Select autocomplete item",
		cmd = "",
		keys = {
			{ "i", "<cr>" },
		},
	},
	{
		category = "Editor",
		desc = "Autocomplete: Next in autocomplete list",
		cmd = "",
		keys = {
			{ "i", "<tab>" },
		},
	},
	{
		category = "Editor",
		desc = "Autocomplete: Previous in autocomplete list",
		cmd = "",
		keys = {
			{ "i", "<s-tab>" },
		},
	},
}, command_center.mode.ADD)
