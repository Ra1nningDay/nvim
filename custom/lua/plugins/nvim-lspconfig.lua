return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            integrations = { lspconfig = false },
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "saghen/blink.cmp" },
        },
        config = function()
            local blink = require("blink.cmp")
            local capabilities = blink.get_lsp_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            local on_attach = function(client, bufnr)
                local opts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
            end

            -- Define configurations via vim.lsp.config
            vim.lsp.config.gopls = {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    gopls = {
                        analyses = { unusedparams = true },
                        staticcheck = true,
                        gofumpt = true,
                    },
                },
            }
            vim.lsp.config.lua_ls = {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        diagnostics = { globals = { 'vim' } },
                    },
                },
            }
            vim.lsp.config.prismals = {
                cmd = { "prisma-language-server", "--stdio" },
                filetypes = { "prisma" },
                root_dir = require("lspconfig.util").root_pattern("package.json", "prisma/schema.prisma"),
                settings = { prisma = { prismaFmtBinPath = "" } },
            }
            vim.lsp.config.pyright = {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "basic",
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            }
            vim.lsp.config.ts_ls = {
                capabilities = capabilities,
                on_attach = on_attach,
                filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
                settings = {
                    typescript = {
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
            }
            vim.lsp.config.tailwindcss = {
                capabilities = capabilities,
                on_attach = on_attach,
                filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
            }

            -- Enable those LSPs
            vim.lsp.enable({
                "gopls",
                "lua_ls",
                "prismals",
                "ts_ls",
                "tailwindcss",
                "pyright",
            })
        end,
    },
}
