require("ecinori.set")
require("ecinori.lazy")

require("ecinori.remap")
require("ecinori.luasnip")

vim.lsp.enable({ "gopls", "lua_ls", "rust_analyzer", "tailwindcss", "ts_ls", "pyright" })

-- TODO: Some day I want to use winborder like this, but currently plenary
-- generates double borders if vim.o.winborder is set, so I just set it on hover
-- vim.o.winborder = "rounded"
vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover({
        border = "rounded",
    })
end)
