return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('bufferline').setup({
                options = {
                    mode = "buffers", -- "buffers" or "tabs"
                    numbers = "none", -- "none" | "ordinal" | "buffer_id" | "both"
                    close_command = "bdelete! %d",
                    right_mouse_command = "bdelete! %d",
                    left_mouse_command = "buffer %d",
                    middle_mouse_command = nil,
                    buffer_close_icon = '󰅖',
                    modified_icon = '●',
                    close_icon = '',
                    left_trunc_marker = '',
                    right_trunc_marker = '',
                    max_name_length = 18,
                    max_prefix_length = 15,
                    truncate_names = true,
                    tab_size = 18,
                    diagnostics = false, -- false | "nvim_lsp" | "coc"
                    diagnostics_update_in_insert = false,
                    diagnostics_update_on_event = true,
                    color_icons = true,
                    show_buffer_icons = true,
                    show_buffer_close_icons = true,
                    show_close_icon = true,
                    show_tab_indicators = true,
                    show_duplicate_prefix = true,
                    separator_style = "thin",
                    always_show_bufferline = true,
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = { 'close' },
                    },
                },
            })
        end,
    },
}
