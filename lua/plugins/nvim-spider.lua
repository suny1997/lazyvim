-- 让w e b 能够支持在 CamelCase 和 snake_case 单词内导航
return {
  "chrisgrieser/nvim-spider",
  opts = {},
  keys = {
    {
      "w",
      "<cmd>lua require('spider').motion('w')<CR>",
      mode = { "n", "o", "x" },
      desc = "Move to start of next of word",
    },
    {
      "e",
      "<cmd>lua require('spider').motion('e')<CR>",
      mode = { "n", "o", "x" },
      desc = "Move to end of word",
    },
    {
      "b",
      "<cmd>lua require('spider').motion('b')<CR>",
      mode = { "n", "o", "x" },
      desc = "Move to start of previous word",
    },
  },
}
