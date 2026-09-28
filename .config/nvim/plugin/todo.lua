-- SLOP
vim.keymap.set("n", "<leader>gt", function()
    local ref = "main" -- opts.args ~= "" and opts.args or "HEAD"
    local diff = vim.fn.system({ "git", "diff", "-U0", ref })
    if vim.v.shell_error ~= 0 then
        vim.notify("git diff failed:\n" .. diff, vim.log.levels.ERROR)
        return
    end

    local items, file, lnum = {}, nil, nil
    for line in diff:gmatch("[^\n\r]+") do
        local new_file = line:match("^%+%+%+ b/(.+)")
        if new_file then
            print("new_file", new_file)
            file = new_file
        elseif line:match("@@") then
            print("here")
            -- @@ -a,b +c,d @@ → c is the first line number in the NEW file
            lnum = tonumber(line:match("^%+%+%+ %S+ %+(%d+)"))
        elseif file and lnum and line:match("^%+") and not line:match("^%+%+%+") then
            if line:find("TODO") then
                table.insert(items, {
                    filename = file,
                    lnum = lnum,
                    col = line:find("TODO"),
                    text = line:sub(2),
                })
            end
            lnum = lnum + 1 -- only + lines advance the new-file line number
        end
        -- note: '-' lines and context lines are ignored entirely
    end
    print(vim.inspect(items))
    vim.fn.setqflist({}, " ", { title = "Added TODOs vs " .. ref, items = items })
    vim.cmd("copen")
end)
