return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
            { 'saghen/blink.cmp' },
        },
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            capabilities.textDocument.completion.completionItem.snippetSupport = true

            local on_attach = function(client, bufnr)
                local opts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)          -- ไปที่ definition
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)                -- แสดง hover documentation
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)      -- เปลี่ยนชื่อตัวแปร
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts) -- แสดง code actions
            end

            local lspconfig = require('lspconfig')

            lspconfig.gopls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                        gofumpt = true,
                    },
                },
            })

            lspconfig['lua_ls'].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }, -- รองรับ global variable `vim`
                        },
                    },
                },
            })

            lspconfig.prismals.setup({
                cmd = { "prisma-language-server", "--stdio" },
                filetypes = { "prisma" },
                root_dir = lspconfig.util.root_pattern("package.json", "prisma/schema.prisma"),
                settings = {
                    prisma = {
                        prismaFmtBinPath = "", -- ตั้งค่าว่างไว้หรือกำหนด path ของ prisma format
                    },
                },
            })

            lspconfig['ts_ls'].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
                settings = {
                    typescript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "none", -- ปิด
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = false,
                            includeInlayVariableTypeHints = false, -- ปิดการแสดง type ของตัวแปร
                            includeInlayPropertyDeclarationTypeHints = false,
                            includeInlayFunctionLikeReturnTypeHints = false, -- ปิด return type
                            includeInlayEnumMemberValueHints = false,
                        },
                    },
                    javascript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "none",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = false,
                            includeInlayVariableTypeHints = false,
                            includeInlayPropertyDeclarationTypeHints = false,
                            includeInlayFunctionLikeReturnTypeHints = false,
                            includeInlayEnumMemberValueHints = false,
                        },
                    },
                },
            })


            lspconfig['tailwindcss'].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
            })
        end,
    }
}
