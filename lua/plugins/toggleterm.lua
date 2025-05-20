return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
            shell = [["C:\Program Files\Git\bin\bash.exe"]],
            size = 10,
            open_mapping = [[<C-\>]],
            direction = "horizontal"
        })
    end
}
