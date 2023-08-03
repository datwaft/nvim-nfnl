-- [nfnl] Compiled from fnl/conf/utils/spec.fnl by https://github.com/Olical/nfnl, do not edit.
local M = {}
M.spec = function(url, _3fspec)
  _G.assert((nil ~= url), "Missing argument url on /Users/datwaft/.config/nvim-nfnl/fnl/conf/utils/spec.fnl:3")
  assert(("string" == type(url)), "expected string for url")
  assert(((_3fspec == nil) or ("table" == type(_3fspec)) or "expected table or nil for spec"))
  local _1_ = (_3fspec or {})
  do end (_1_)[1] = url
  return _1_
end
return M
