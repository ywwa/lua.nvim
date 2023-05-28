local present, tmux = pcall(require, "tmux")

if not present then
  return
end

  tmux.setup {
    copy_sync = {
      enable = true,
      sync_clipboard = true,
      sync_registers = true,
      sync_deletes = true,
      sync_unnamed = true,
    },
    navigation = {
      cycle_navigation = true,
      enable_default_keybindings = false,
      persist_zoom = false,
    },
    resize = {
      enable_default_keybindings = false,
      resize_step_x = 2,
      resize_step_y = 2,
    },
  }
