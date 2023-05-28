local present, zenMode = pcall(require, "zen-mode")

if not present then
  return
end

zenMode.setup {
  window = {
    backdrop = 0.93,
    width = 100,
    height = 1,
  },
  plugins = {
    options = {
      enabled = true,
      showcmd = true,
    },
    twilight = { enabled = true },
    tmux = { enabled = true },

    alacritty = {
      enabled = false,
      font = "14",
    },
    kitty = {
      enabled = true,
      font = "+4",
    },
  },
}
