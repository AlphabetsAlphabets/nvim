return {
    'maxmx03/solarized.nvim',
    'sainnhe/everforest',
    'shaunsingh/nord.nvim',
    { 
        'NTBBloodbath/sweetie.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("set background=light")
            vim.cmd("colorscheme gruvbox")
            vim.cmd("colorscheme sweetie")
        end,
    },
    { "ellisonleao/gruvbox.nvim",                 priority = 1000 },
}
