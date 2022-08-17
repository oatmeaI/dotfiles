vim.keymap.set('n', '<space>c', function()
    local telescope_actions = require("telescope.actions")
    local telescope_action_set = require("telescope.actions.set")
    local action_state = require "telescope.actions.state"
    local buffers =
    local allfiles = require"telescope.builtin".oldfiles()
    for k,v in pairs(buffers) do oldfiles[k] = v end
    -- create our picker
    require('telescope.pickers').new(theme, {
        prompt = 'Files',
        finder = require('telescope.finders').new_table {
            results = allfiles
        },
        sorter = require('telescope.config').values.generic_sorter(theme),
        attach_mappings = function(bufnr)
            -- change the colors upon selection
            telescope_actions.select_default:replace(function()
                set_colorscheme(action_state.get_selected_entry().value)
                telescope_actions.close(bufnr)
            end)
            telescope_action_set.shift_selection:enhance({
                -- change the colors upon scrolling
                post = function()
                    vim.cmd('colorscheme ' .. action_state.get_selected_entry().value)
                    vim.cmd('hi TabLineFill guibg=clear')
                end
            })
            return true
        end
    }):find()
end)
