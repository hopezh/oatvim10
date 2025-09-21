return {
    {
        "nvim-mini/mini.align",

        version = false,

        config = function()
            require("mini.align").setup({
                mappings = {
                    start = "ma",
                    start_with_preview = "gA",
                },
            })
        end,
    },

    {
        "nvim-mini/mini.surround",

        recommended = true,

        keys = function(_, keys)
            -- Populate the keys based on the user's options
            local opts = LazyVim.opts("mini.surround")
            local mappings = {
                { opts.mappings.add, desc = "Add Surrounding", mode = { "n", "v" } },
                { opts.mappings.delete, desc = "Delete Surrounding" },
                { opts.mappings.find, desc = "Find Right Surrounding" },
                { opts.mappings.find_left, desc = "Find Left Surrounding" },
                { opts.mappings.highlight, desc = "Highlight Surrounding" },
                { opts.mappings.replace, desc = "Replace Surrounding" },
                { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
            }
            mappings = vim.tbl_filter(function(m)
                return m[1] and #m[1] > 0
            end, mappings)
            return vim.list_extend(mappings, keys)
        end,

        opts = {
            mappings = {
                -- original keymaps ------------------------------------------------
                -- add = "gsa", -- Add surrounding in Normal and Visual modes
                -- delete = "gsd", -- Delete surrounding
                -- find = "gsf", -- Find surrounding (to the right)
                -- find_left = "gsF", -- Find surrounding (to the left)
                -- highlight = "gsh", -- Highlight surrounding
                -- replace = "gsr", -- Replace surrounding
                -- update_n_lines = "gsn", -- Update `n_lines`

                -- my keymaps ------------------------------------------------------
                add = "msa", -- Add surrounding in Normal and Visual modes
                delete = "msd", -- Delete surrounding
                find = "msf", -- Find surrounding (to the right)
                find_left = "msF", -- Find surrounding (to the left)
                highlight = "msh", -- Highlight surrounding
                replace = "msr", -- Replace surrounding
                update_n_lines = "msn", -- Update `n_lines`
            },
        },
    },
}
