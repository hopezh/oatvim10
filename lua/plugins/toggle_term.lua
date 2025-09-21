return {
    "akinsho/toggleterm.nvim",

    version = "*",

    -- config = true,

    cmd = "ToggleTerm",

    keys = {
        {
            "<F3>",
            "<cmd>ToggleTerm<cr>",
            desc = "Toggle floating terminal",
        },
    },

    -- add keymap to use <C-h>/<C-l> to move btw terminal and editor
    -- based on suggestion of perplexity
    config = function()
        require("toggleterm").setup({
            direction = "horizontal", -- vertical, horizontal, float, tab

            size = function(term)
                if term.direction == "horizontal" then
                    return 20
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.45
                    -- return 80
                end
            end,

            open_mapping = [[<F3>]],
        })

        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
            vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
        end

        vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

        vim.api.nvim_set_keymap("n", "<C-h>", "<C-W>h", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<C-l>", "<C-W>l", { noremap = true, silent = true })
    end,

    -- opts = {
    --     open_mapping = [[<F3>]],
    --
    --     -- size can be a number or function which is passed the current terminal
    --     size = function(term)
    --         if term.direction == "horizontal" then
    --             return 20
    --         elseif term.direction == "vertical" then
    --             return vim.o.columns * 0.4
    --             -- return 80
    --         end
    --     end,
    --
    --     -- direction = "float",
    --     -- direction = "horizontal",
    --     direction = "vertical",
    --     -- direction = "tab",
    --
    --     shade_filetypes = {},
    --     ide_numbers = true,
    --     insert_mappings = true,
    --     terminal_mappings = true,
    --     start_in_insert = true,
    --     close_on_exit = true,
    --
    --     float_opts = {
    --         border = "curved",
    --         -- border = "shadow",
    --         -- width = 100,
    --         -- height = 100,
    --     },
    -- },
}
