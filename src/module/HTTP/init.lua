local env = (getfenv or
              function() return _ENV; end)()

if game and _VERSION == 'Luau' then
  require(script.Parent.polyfill).roblox();
end

local wrap = function( t )
  assert(t.Get, 'INTERNAL: GET NOT FOUND')
  assert(t.Post, 'INTERNAL: POST NOT FOUND')
  assert(
    t.Request,
    'INTERNAL: GENERIC_REQUEST NOT FOUND'
  )

  for k, v in pairs(t) do
    t[string.lower(k)] = v;
    t[string.upper(k)] = v;
  end

  local mt = {
    __index = t;
    __newindex = function()
      error('Attempt to modify Read-only table', 2)
    end;
    __call = function( t, ... )
      return t.Request(...)
    end;
  };
  mt['__metatable'] = mt;
  return setmetatable({}, mt);
end

-- Check if is vanilla Lua
if _VERSION == 'Lua 5' or _VERSION == 'Lua 5.0' or
  _VERSION == 'Lua 5.1' or _VERSION == 'Lua 5.2' or
  _VERSION == 'Lua 5.3' or _VERSION == 'Lua 5.4' or
  _VERSION == 'Lua 5.5' then
  return wrap(require('Vanilla'))
end

-- Check if is Roblox
if _VERSION == 'Luau' and env.game and env.script then
  local RunService = game:GetService('RunService')
  -- Check if is client
  if RunService:IsClient() then
    error('Clients are currently unsupported', 2)
  end
end
error(
  'No HTTP implementation found for this environment',
  2
)
