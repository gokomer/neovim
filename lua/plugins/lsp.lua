return 
{
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        lazy = true,
        config = false,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = {'LspInfo', 'LspInstall', 'LspStart'},
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
        },
    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.extend_lspconfig({
            sign_text = true,
            sign_text = {
                error = '✘',
                warn = '▲',
                hint = '⚑',
                info = '»',
              },
            lsp_attach = lsp_attach,
            capabilities = require('cmp_nvim_lsp').default_capabilities()
        })

        require('mason-lspconfig').setup({
            ensure_installed = {"pyright", "ruff"},
            handlers = {
                -- this first function is the "default handler"
                -- it applies to every language server without a "custom handler"
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
                

                ruff = function()
                    require('lspconfig').ruff.setup({
                        flags = {
                            allow_incremental_sync = false,
                            debounce_text_changes = 1000,
                        },
                        on_attach = function(client, bufnr)
                            -- Other configurations
                        
                            -- Enable update_in_insert for diagnostics
                            vim.diagnostic.config {
                            virtual_text = {
                                prefix = "●",
                            },
                            update_in_insert = true,
                            }
                        end,
                        
                    })
                end,

                pyright = function()
                    require('lspconfig').pyright.setup {
                        handlers = {
                            -- I use ruff for diagnostics. So I disalbe in pyright.
                            ["textDocument/publishDiagnostics"] = function() end,
                        },
                        settings = {
                            pyright = {
                                -- Using Ruff's import organizer
                                disableOrganizeImports = true,
                            },
                            python = {
                                analysis = {
                                    -- Ignore all files for analysis to exclusively use Ruff for linting
                                    ignore = { "*" },
                                    logLevel = "Information",
                                    autoImportCompletions = true,
                                    autoSearchPaths = true,
                                    diagnosticMode = "off",
                                    typeCheckingMode = "off",
                                    useLibraryCodeForTypes = false,
                                },
                            },
                        },
                    }
                end,
            }
        })
        end
    }
}