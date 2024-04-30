-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" }
local util = require "lspconfig/util"


-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" }, 
  filetypes={"go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git")
}
 

lspconfig.dartls.setup{
   cmd = { 'dart', 'language-server', '--protocol=lsp' },
    filetypes = { 'dart' },
    root_dir = util.root_pattern 'pubspec.yaml',
    init_options = {
      onlyAnalyzeProjectsWithOpenFiles = true,
      suggestFromUnimportedLibraries = true,
      closingLabels = true,
      outline = true,
      flutterOutline = true,
    },
    settings = {
      dart = {
        completeFunctionCalls = true,
        showTodos = true,
      },
  },

}

 
