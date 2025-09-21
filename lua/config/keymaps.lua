-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- use "jk" to ESC -------------------------------------------------------------
vim.keymap.set("c", "jk", "<ESC>") -- command-line mode
vim.keymap.set("i", "jk", "<ESC>") -- insert mode
vim.keymap.set("o", "jk", "<ESC>") -- operator pending mode
vim.keymap.set("s", "jk", "<ESC>") -- select mode
vim.keymap.set("v", "jk", "<ESC>") -- visual & select mode
vim.keymap.set("x", "jk", "<ESC>") -- visual mode

-- use "<leader>qp" to add a python code block in quarto .qmd file
vim.api.nvim_create_autocmd("FileType", {
    pattern = "quarto",
    callback = function()
        local wk = require("which-key")
        wk.register({
            ["<leader>q"] = {
                p = {
                    function()
                        local lines = { "```{python}", "", "```" }
                        local row, col = unpack(vim.api.nvim_win_get_cursor(0))
                        vim.api.nvim_buf_set_lines(0, row, row, false, lines)
                        vim.api.nvim_win_set_cursor(0, { row + 2, 0 })
                        vim.cmd("startinsert")
                    end,
                    "Insert Python code block",
                },
            },
        }, { buffer = true })
    end,
})
