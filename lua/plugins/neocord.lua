return {
  "IogaMaster/neocord",
  event = "VeryLazy",
  opts = {
    global_timer = true,
    ---comment
    ---@param project_name string|nil
    ---@param filename string|nil
    ---@return string
    workspace_text = function(project_name, filename)
      local function anon(input)
        -- Use your specified character set
        local charSet = {
          "▀",
          "▃",
          "▄",
          "▅",
          "▆",
          "▌",
          "▋",
          "▊",
          "▉",
          "█",
          "▇",
          "▍",
          "▐",
          "░",
          "▒",
          "▓",
          "❘",
          "❙",
          "❚",
        }

        local outputStr = {}
        -- Replace each character in input with a random character
        for _ = 1, #input do
          local randomIndex = math.random(1, #charSet)
          table.insert(outputStr, charSet[randomIndex])
        end

        return table.concat(outputStr)
      end

      if project_name then
        return "Working on " .. anon(project_name)
      end

      return "Working on " .. (filename or "unknown file")
    end,
  },
}
