return {
    "goolord/alpha-nvim",
    -- dependencies = { 'echasnovski/mini.icons' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Read header from file
        local header = {}
        local header_path = vim.fn.stdpath("config") .. "/lua/bliss/ascii_art.txt"
        for line in io.lines(header_path) do
            table.insert(header, line)
        end

        -- Set header
        dashboard.section.header.val = header
        dashboard.section.header.opts = {
            position = "center",
            hl = "Type"
        }

        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("f", "  > Find file", ":Telescope find_files<CR>"),
            dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
            dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
            dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
        }

        -- Set footer
        dashboard.section.footer.val = "yo 😈"

        -- Configure layout with proper padding for vertical centering
        dashboard.config.layout = {
            { type = "padding", val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) } },
            dashboard.section.header,
            { type = "padding", val = 2 },
            dashboard.section.buttons,
            { type = "padding", val = 1 },
            dashboard.section.footer,
        }

        -- Setup alpha with noautocmd option
        alpha.setup({
            layout = dashboard.config.layout,
            opts = {
                noautocmd = true,
                margin = 5
            }
        })

        -- Disable folding on alpha buffer
        vim.cmd([[
            autocmd FileType alpha setlocal nofoldenable
        ]])
    end,
}
