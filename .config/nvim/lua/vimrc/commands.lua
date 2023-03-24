local vim = vim

vim.cmd([[command! Ls :lua MiniSessions.select()]])
vim.cmd([[command! Silicon :lua require('silicon').visualise_cmdline({})]])
vim.cmd([[command! Ms :lua MiniSessions.write(require('utils/helpers').getSessionName(), {force = true})]])
