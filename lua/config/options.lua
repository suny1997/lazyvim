-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if os.getenv("WSLENV") then
  vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
      ['+'] = 'clip.exe',
      ['*'] = 'clip.exe',
    },
    paste = {
      ['+'] =
      'powershell.exe -c [Console]::OutputEncoding = [System.Text.Encoding]::UTF8; [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ['*'] =
      'powershell.exe -c [Console]::OutputEncoding = [System.Text.Encoding]::UTF8; [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = false,
  }
  -- 设置剪贴板选项
  vim.opt.clipboard = "unnamed,unnamedplus"
  -- 确保 Neovim 使用 UTF-8 编码
  vim.opt.encoding = "utf-8"
  vim.opt.fileencoding = "utf-8"
end
