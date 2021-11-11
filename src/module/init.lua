-----------------------------------------------------------------
-- Roblox package Manager                                      --
--   A Lua5.1 & Luau standard compliant Roblox Package Manager --
-----------------------------------------------------------------
-- @copyright (c) 2021 Mokiy.                                  --
-- @license MIT                                                --
-----------------------------------------------------------------
if game and _VERSION == 'Luau' then
  require(script.polyfill).roblox();
end
