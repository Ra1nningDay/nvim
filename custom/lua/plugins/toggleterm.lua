return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
            -- shell = [["C:\\Program Files\\Git\\bin\\bash.exe"]],
            shell = vim.o.shell, -- Use the default shell
            size = 10,
            open_mapping = [[<C-\>]],
            direction = "horizontal",
            auto_scroll = false,
        })
    end
}
