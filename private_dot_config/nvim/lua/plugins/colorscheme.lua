-- Light/dark follows ~/.local/state/theme, written by `theme` (dotfiles/dot_local/bin/executable_theme)
local state = (os.getenv("XDG_STATE_HOME") or (os.getenv("HOME") .. "/.local/state")) .. "/theme"

local function mode()
  local f = io.open(state)
  if not f then return "light" end
  local m = f:read("*l")
  f:close()
  return m == "dark" and "dark" or "light"
end

return {
  {
    "maxmx03/solarized.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(_, opts)
      vim.o.termguicolors = true
      vim.o.background = mode()
      require("solarized").setup(opts)
      vim.cmd.colorscheme("solarized")

      -- pick up `theme toggle` run elsewhere when this nvim regains focus
      vim.api.nvim_create_autocmd({ "FocusGained", "VimResume" }, {
        callback = function()
          local m = mode()
          if vim.o.background ~= m then
            vim.o.background = m
            vim.cmd.colorscheme("solarized")
          end
        end,
      })
    end,
  },
}
