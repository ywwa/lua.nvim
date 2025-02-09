local config = require "modules.config"

if config.colorify.enabled then
  require("modules.colorify").run()
end

if config.tabufline.enabled then
  require "modules.tabufline.lazyload"
end
