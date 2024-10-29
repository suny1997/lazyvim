-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

--设置自动命令,取消在注释行按回车自动生成新行注释
vim.cmd([[
autocmd FileType * set formatoptions-=cro
]])

if os.getenv("WSLENV") then
  --自动命令,检测到vimLeave事件和FocusGained事件时执行切换输入法命令
  --只要退出编辑模式,就执行一次im-select 1033
  vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    callback = function()
      vim.cmd(":silent :!/mnt/d/typewriting/switch/im-select.exe 1033")
    end,
  })
  --只要进入编辑模式,就执行一次im-select 2052
  vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    callback = function()
      vim.cmd(":silent :!/mnt/d/typewriting/switch/im-select.exe 2052")
    end,
  })
  --需要在退出vim前执行一次im-select 2052
  vim.api.nvim_create_autocmd({ "VimLeave" }, {
    callback = function()
      vim.cmd(":silent :!/mnt/d/typewriting/switch/im-select.exe 2052")
    end,
  })
  --聚焦vim时执行一次im-select 2052
  vim.api.nvim_create_autocmd({ "FocusGained" }, {
    callback = function()
      vim.cmd(":silent :!/mnt/d/typewriting/switch/im-select.exe 2052")
    end,
  })
  --vim不是当前窗口时,执行一次im-select 2052
  vim.api.nvim_create_autocmd({ "FocusLost" }, {
    callback = function()
      vim.cmd(":silent :!/mnt/d/typewriting/switch/im-select.exe 2052")
    end,
  })
  --自动命令,去掉^M
  -- 创建一个自动命令组
  vim.api.nvim_create_augroup("RemoveCarriageReturn", { clear = true })

  -- 在粘贴之前处理剪贴板内容
  vim.api.nvim_create_autocmd("TextYankPost", {
    group = "RemoveCarriageReturn",
    callback = function()
      if vim.v.event.operator == "p" or vim.v.event.operator == "P" then
        local clipboard = vim.fn.getreg("+")
        clipboard = clipboard:gsub("\r\n", "\n")
        vim.fn.setreg("+", clipboard)
      end
    end,
  })

  -- 重新映射粘贴键以使用处理后的剪贴板内容
  vim.keymap.set("n", "p", function()
    local clipboard = vim.fn.getreg("+")
    clipboard = clipboard:gsub("\r\n", "\n")
    vim.fn.setreg('"', clipboard)
    return "p"
  end, { expr = true, silent = true })

  vim.keymap.set("n", "P", function()
    local clipboard = vim.fn.getreg("+")
    clipboard = clipboard:gsub("\r\n", "\n")
    vim.fn.setreg('"', clipboard)
    return "P"
  end, { expr = true, silent = true })
end
