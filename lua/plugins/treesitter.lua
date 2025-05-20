return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            require('nvim-treesitter.configs').setup({
                sync_install = true,                                                                            -- ติดตั้ง parser ทันที
                ensure_installed = { 'lua', 'python', 'javascript', 'html', 'css', 'go', 'typescript', 'tsx' }, -- เพิ่ม TypeScript/TSX
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                },
            })
        end,
    },
}
