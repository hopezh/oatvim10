return {
    "MeanderingProgrammer/render-markdown.nvim",

    -- dependencies = {
    --   "nvim-treesitter/nvim-treesitter",
    --   "nvim-tree/nvim-web-devicons",
    -- },

    -- opts = {
    --   file_types = { "markdown", "quarto" },
    --   code = { above = "", below = "" },
    -- },

    -- add background color for code blocks in quarto and markdown files
    config = function()
        require("render-markdown").setup({
            file_types = { "markdown", "quarto" },
            code = { above = "", below = "" },
        })
    end,
}
