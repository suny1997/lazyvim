-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
-- Insert模式 j+k设置为esc
map("i", "jk", "<Esc>")
-- normal模式 实现物理行的跳转
map("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
map("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })
-- visual模式 单行或多行移动
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

--跟tmux联动,移动pane
map({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>")
map({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>")
map({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>")
map({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>")
