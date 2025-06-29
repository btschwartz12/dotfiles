return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            {
                "rcarriga/nvim-dap-ui",
                dependencies = {
                    "nvim-neotest/nvim-nio"
                }
            },
            "leoluz/nvim-dap-go",
        },
        config = function()
            local dap = require('dap')
            local dapui = require('dapui')

            -- DAP UI setup
            dapui.setup()

            -- Automatically open/close dapui when debugging starts/ends
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            -- Set up nvim-dap-go
            require('dap-go').setup({
                -- Additional dap configurations
                dap_configurations = {
                    {
                        type = "go",
                        name = "Debug Package Tests",
                        request = "launch",
                        mode = "test",
                        program = "${fileDirname}"
                    },
                },
                delve = {
                    initialize_timeout_sec = 20,
                    port = "${port}"
                },
            })

            -- Keymaps
            -- Test debugging
            vim.keymap.set('n', '<leader>dt', function() require('dap-go').debug_test() end, { desc = 'Debug Nearest Test' })
            vim.keymap.set('n', '<leader>dT', function() require('dap-go').debug_last_test() end, { desc = 'Debug Last Test' })
            
            -- Core debugging
            vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end, { desc = 'Debug: Start/Continue' })
            vim.keymap.set('n', '<leader>do', function() require('dap').step_over() end, { desc = 'Debug: Step Over' })
            vim.keymap.set('n', '<leader>di', function() require('dap').step_into() end, { desc = 'Debug: Step Into' })
            vim.keymap.set('n', '<leader>dO', function() require('dap').step_out() end, { desc = 'Debug: Step Out' })
            
            -- Breakpoints
            vim.keymap.set('n', '<leader>db', function() require('dap').toggle_breakpoint() end, { desc = 'Debug: Toggle Breakpoint' })
            vim.keymap.set('n', '<leader>dB', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { desc = 'Debug: Set Conditional Breakpoint' })
            
            -- UI and REPL
            vim.keymap.set('n', '<leader>dr', function() require('dap').repl.open() end, { desc = 'Debug: Open REPL' })
            vim.keymap.set('n', '<leader>dl', function() require('dap').run_last() end, { desc = 'Debug: Run Last' })
            vim.keymap.set('n', '<leader>du', function() require('dapui').toggle() end, { desc = 'Debug: Toggle UI' })
        end
    }
} 