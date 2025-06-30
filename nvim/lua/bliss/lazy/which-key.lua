return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        plugins = {
            marks = true,
            registers = true,
            spelling = {
                enabled = true,
                suggestions = 20,
            },
            presets = {
                operators = true,
                motions = true,
                text_objects = true,
                windows = true,
                nav = true,
                z = true,
                g = true,
            },
        },
        icons = {
            breadcrumb = "»",
            separator = "➜",
            group = "+",
            mappings = true,
            colors = true, -- use the highlights from mini.icons
        },
    },
    config = function()
        local wk = require("which-key")
        wk.setup({})
        
        wk.add({
            -- Main groups with icons
            { "<leader>d", group = "Debug/DAP", icon = { kind = "Debug" } },
            { "<leader>v", group = "LSP", icon = { kind = "Method" } },
            { "<leader>f", group = "Find/Telescope", icon = { kind = "Search" } },
            { "<leader>t", group = "Trouble", icon = { kind = "Error" } },

            -- DAP specific mappings
            { "<leader>dt", function() require('dap-go').debug_test() end, desc = "Debug Test" },
            { "<leader>dT", function() require('dap-go').debug_last_test() end, desc = "Debug Last Test" },
            { "<leader>dc", function() require('dap').continue() end, desc = "Continue" },
            { "<leader>do", function() require('dap').step_over() end, desc = "Step Over" },
            { "<leader>di", function() require('dap').step_into() end, desc = "Step Into" },
            { "<leader>dO", function() require('dap').step_out() end, desc = "Step Out" },
            { "<leader>db", function() require('dap').toggle_breakpoint() end, desc = "Toggle Breakpoint" },
            { "<leader>dB", function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Conditional Breakpoint" },
            { "<leader>dr", function() require('dap').repl.open() end, desc = "Open REPL" },
            { "<leader>dl", function() require('dap').run_last() end, desc = "Run Last" },
            { "<leader>du", function() require('dapui').toggle() end, desc = "Toggle UI" },

            -- LSP specific mappings
            { "<leader>vd", function() vim.diagnostic.open_float() end, desc = "Open Float Diagnostic" },
            { "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, desc = "Workspace Symbol" },
            { "<leader>vca", function() vim.lsp.buf.code_action() end, desc = "Code Action" },
            { "<leader>vrr", function() vim.lsp.buf.references() end, desc = "References" },
            { "<leader>vrn", function() vim.lsp.buf.rename() end, desc = "Rename" },

            -- Find/Telescope mappings
            { "<leader>ff", function() require('telescope.builtin').find_files({ hidden = true, file_ignore_patterns = { "%.git/" } }) end, desc = "Find Files" },
            { "<leader>fg", function() require('telescope.builtin').git_files() end, desc = "Git Files" },
            { "<leader>fb", function() require('telescope.builtin').buffers() end, desc = "Find Buffers" },
            { "<leader>fw", function() 
                local word = vim.fn.expand("<cword>")
                require('telescope.builtin').grep_string({ search = word })
            end, desc = "Find Word Under Cursor" },
            { "<leader>fW", function()
                local word = vim.fn.expand("<cWORD>")
                require('telescope.builtin').grep_string({ search = word })
            end, desc = "Find WORD Under Cursor" },
            { "<leader>fs", function()
                require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") })
            end, desc = "Search String" },

            -- Trouble mappings
            { "<leader>tt", function() require("trouble").toggle() end, desc = "Toggle Trouble" },
        })
    end
} 