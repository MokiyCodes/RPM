if game and _VERSION == 'Luau' then
  require(script.Parent.Parent.polyfill).roblox();
end

warn(
  'The Vanilla Lua HTTP module is currently still in development.'
)

local https = require'ssl.https'

local getCacheName = function(
  url, headers, method
 )
  return
    { [0] = url; [1] = headers; [2] = method }
end

local cached = {}

local Request = function(
  method, url, headers, cache
 )
  if type(cache) == 'nil' then cache = true end

  local cacheName

  if cache then -- check cache
    cacheName = getCacheName(url, headers, method)
  end

  local result = https.request(
    {
      url = url;
      headers = headers;
      method = method;
    }
  )

  return result
end;

return {
  --- @name Get
  --- @description A simple HTTP Get Request
  --- @see Request
  --- @param url string URL to get
  --- @param headers any Headers for the request
  --- @param cache boolean Cache the request? (default: true)
  Get = function( url, headers, cache )
    return Request('GET', headers, cache)
  end;
  Post = function( url, headers, body, cache ) end;
  Request = Request;
}
