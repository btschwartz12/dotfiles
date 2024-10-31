return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "v1.1.1",
        lazy = false,
        dependencies = {
        "nvim-tree/nvim-web-devicons",
        },
        config = function()
        require("nvim-tree").setup {
        git = {
            ignore = false,
        },
        filters = {
            dotfiles = false,
        },
        }
        end,
    },
}