return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { 'lua', 'python', 'javascript', 'html', 'css', 'go' },
                indent = {
                    enable = true,
                },
                highlight = {
                    enable = true,
                    disable = { "typescript" },
                },
            })
        end,
    },
}
