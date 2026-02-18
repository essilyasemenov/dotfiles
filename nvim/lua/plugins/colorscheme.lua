return {
  {
    "essilyasemenov/heather.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("heather").load()
    end,
  },
}
