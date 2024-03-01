local config = require("custom.chadrc").utils

local rpc = require "custom.utils.rpc"
rpc(config.enable_rpc)

require("custom.utils.cc").setup()
require("custom.utils.so").setup()
