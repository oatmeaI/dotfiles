local vim = vim

-- Template for git blame string in statusline
vim.g.gitblame_message_template = "<author>, <date>"
-- ???
vim.g.gitblame_display_virtual_text = 0
-- Format git blame like "3 days ago"
vim.g.gitblame_date_format = "%r"
