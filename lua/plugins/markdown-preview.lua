return {
  -- markdown文档,预览等
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    config = function()
      local install_path = vim.fn.stdpath("data") .. "/lazy/markdown-preview.nvim/app"
      local node_modules = install_path .. "/node_modules"
      if vim.fn.empty(vim.fn.glob(node_modules)) > 0 then
        vim.cmd("!cd " .. install_path .. " && npm install")
      end
      vim.g.mkdp_auto_close = 0
    end,
  },
  -- 粘贴图像到markdown文档
  -- 需要python的pillow库,wl-paste
  -- sudo apt install python3-pil
  -- sudo apt install wl-clipboard
  -- 还需要借助wslg
  {
    "TobinPalmer/pastify.nvim",
    cmd = { "Pastify" },
    opts = {
      absolute_path = false,
      apikey = "",
      local_path = "/assets/imgs/",
      save = "local",
    },
  },
}
