--[[
    http://learnxinyminutes.com/docs/lua/
    :help lua-guide
    (or HTML version): https://neovim.io/doc/user/lua-guide.html
    :Tutor
    :help
    :help X
    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.
--]]

-- Enable faster startup by caching compiled Lua modules
vim.loader.enable()

--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- [[ Intro to `vim.pack` ]]
-- `vim.pack` is a new plugin manager built into Neovim,
--  which provides a Lua interface for installing and managing plugins.
--
--  See `:help vim.pack`, `:help vim.pack-examples` or the
--  excellent blog post from the creator of vim.pack and mini.nvim:
--  https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack
--
--  To inspect plugin state and pending updates, run
--    :lua vim.pack.update(nil, { offline = true })
--
--  To update plugins, run
--    :lua vim.pack.update()
--
--
--  Throughout the rest of the config there will be examples
--  of how to install and configure plugins using `vim.pack`.
--
--  In this section we set up some autocommands to run build
--  steps for certain plugins after they are installed or updated.

local function run_build(name, cmd, cwd)
  local result = vim.system(cmd, { cwd = cwd }):wait()
  if result.code ~= 0 then
    local stderr = result.stderr or ''
    local stdout = result.stdout or ''
    local output = stderr ~= '' and stderr or stdout
    if output == '' then output = 'No output from build command.' end
    vim.notify(('Build failed for %s:\n%s'):format(name, output), vim.log.levels.ERROR)
  end
end

-- This autocommand runs after a plugin is installed or updated and
--  runs the appropriate build command for that plugin if necessary.
--
-- See `:help vim.pack-events`
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if kind ~= 'install' and kind ~= 'update' then return end

    if name == 'telescope-fzf-native.nvim' and vim.fn.executable 'make' == 1 then
      run_build(name, { 'make' }, ev.data.path)
      return
    end

    if name == 'LuaSnip' then
      if vim.fn.has 'win32' ~= 1 and vim.fn.executable 'make' == 1 then run_build(name, { 'make', 'install_jsregexp' }, ev.data.path) end
      return
    end

    if name == 'nvim-treesitter' then
      if not ev.data.active then vim.cmd.packadd 'nvim-treesitter' end
      vim.cmd 'TSUpdate'
      return
    end
  end,
})

local gh = function(repo) return 'https://github.com/' .. repo end

---@type (string|vim.pack.Spec)[]
local plugins = {
  -- You can specify plugins with a git URL. `vim.pack` then uses the default branch (usually `main` or `master`)
  -- You can also specify plugins with a version range for semver git tags
  --  See `:help vim.version.range()` for more info
  { src = gh 'saghen/blink.cmp', version = vim.version.range '1.*' },
  { src = gh 'L3MON4D3/LuaSnip', version = vim.version.range '2.*' },
  gh 'folke/todo-comments.nvim',
}

if vim.fn.executable 'make' == 1 then table.insert(plugins, gh 'nvim-telescope/telescope-fzf-native.nvim') end

-- Useful for getting pretty icons, but requires a Nerd Font.
if vim.g.have_nerd_font then table.insert(plugins, gh 'nvim-tree/nvim-web-devicons') end

-- NOTE: Here is where the plugins are actually installed and added to the path
vim.pack.add(plugins)

require 'options'
require 'autocmds'
require 'plugins.init'

vim.schedule(function() require 'mappings' end)

-- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
-- init.lua. If you want these files, they are in the repository, so you can just download them and
-- place them in the correct locations.

-- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
--
--  Here are some example plugins that I've included in the Kickstart repository.
--  Uncomment any of the lines below to enable them (you will need to restart nvim).
--
-- require 'kickstart.plugins.debug'
-- require 'kickstart.plugins.indent_line'
-- require 'kickstart.plugins.lint'
-- require 'kickstart.plugins.autopairs'
-- require 'kickstart.plugins.neo-tree'
-- require 'kickstart.plugins.gitsigns' -- adds gitsigns recommended keymaps

-- NOTE: You can add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
--
--  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
-- require 'custom.plugins'
--
-- For additional information with loading, sourcing and examples see `:help vim.pack`
-- and `:help vim.pack-examples`

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
