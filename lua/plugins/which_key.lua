return {
    "folke/which-key.nvim",

    opts = {
        plugins = { spelling = true },

        defaults = {
            -- mode = { "n", "v" },

            -- add a keymap group for oatkey
            -- ["<leader>z"] = {
            --     name = "OatKey",
            --     m = {
            --         "<cmd>CellularAutomaton make_it_rain<CR>",
            --         "Make it rain...",
            --     },
            --     g = {
            --         "<cmd>CellularAutomaton game_of_life<CR>",
            --         "Game of life...",
            --     },
            -- },
        },
    },

    config = function()
        local wk = require("which-key")

        wk.add({
            { "g", group = "+goto" },
            { "z", group = "+fold" },
            { "ms", group = "+mini_surround" },
            { "<leader>q", group = "Quarto/Quit" },
            { "<leader>z", group = "OatKey" },
            { "<leader>zm", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "make it rain..." },
            { "<leader>zg", "<cmd>CellularAutomaton game_of_life<CR>", desc = "game of life..." },
            { "<leader>uP", "<cmd>Precognition toggle<CR>", desc = "toggle precognition" },
        })
    end,
}
