return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    -- Windows-specifika optimeringar
    sync_install = false,
    auto_install = true,
  },
  config = function(_, opts)
    -- Vi kollar om modulen finns innan vi kör den för att slippa kraschen i bilden
    local status, ts = pcall(require, "nvim-treesitter.configs")
    if status then
      ts.setup(opts)
      -- Tvinga den att använda zig som vi installerade via winget
      require("nvim-treesitter.install").compilers = { "zig" }
    end
  end,
}
