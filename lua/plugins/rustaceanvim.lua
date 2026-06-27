local snippets = {
  ['get_n_vector'] = {
    prefix = '_get_n_vector',
    body = [[
let n: usize = scan.next();
let a: Vec<u64> = (0..n).map(|_| scan.next()).collect();
]],
  },
  ['get_n_loop'] = {
    prefix = '_get_n_loop',
    body = [[
let n: usize = scan.next();
let mut a = vec![];
for i in 0..n {
  let ai : u64 = scan.next();
  a.push(ai);
}
]],
  },
}

---@param repo string
---@return string
local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  { src = gh 'mrcjkb/rustaceanvim', version = vim.version.range '^6' },
}

-- TODO: lazy = false

vim.g.rustaceanvim = {
  server = {
    on_attach = function()
      vim.keymap.set('n', '<leader>ca', function()
        vim.cmd.RustLsp 'codeAction' -- supports rust-analyzer's grouping
        -- or vim.lsp.buf.codeAction() if you don't want grouping.
        vim.keymap.set('n', 'K', function() vim.cmd.RustLsp('hover', 'actions') end, { desc = 'LSP Hover Actions' })
      end, { desc = 'LSP Code Action' })
    end,
    settings = {
      ['rust-analyzer'] = {
        cargo = {
          allFeatures = true,
        },
        check = {
          command = 'clippy',
        },
        completion = {
          snippets = {
            custom = snippets,
          },
        },
      },
    },
  },
}
