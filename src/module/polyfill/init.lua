return {
  ['roblox'] = function()
    -- Get caller environment
    local env = getfenv(2)
    -- Utility functions
    local resolveInstancePath =
      function( str ) -- works in most cases
        local split = string.split(str, '.')
        local mnName = table.remove(split, 1)
        local main = getfenv(3)[mnName]
        if not main then
          error(mnName .. ' not found')
        end
        local current = main;
        for _, v in pairs(split) do
          current = current:FindFirstChild(v)
          if not current then
            error('Cannot resolve path!')
          end
        end
        return current
      end
    -- Replace require
    local oldRequire = env.require;
    env.require = function( module )
      if (type(module) == 'string') then
        module = 'script.' .. string.gsub(
          string.gsub(
            string.gsub(
              module, './', ''
            ), '/init.lua', ''
          ), '/', '.'
        ) -- should return a semi-full name in most cases
        return oldRequire(
          resolveInstancePath(
            module
          )
        )
      else
        return oldRequire(module)
      end
    end
  end;
}
