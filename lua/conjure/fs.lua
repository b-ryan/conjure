local _0_0 = nil
do
  local name_23_0_ = "conjure.fs"
  local loaded_23_0_ = package.loaded[name_23_0_]
  local module_23_0_ = nil
  if ("table" == type(loaded_23_0_)) then
    module_23_0_ = loaded_23_0_
  else
    module_23_0_ = {}
  end
  module_23_0_["aniseed/module"] = name_23_0_
  module_23_0_["aniseed/locals"] = (module_23_0_["aniseed/locals"] or {})
  module_23_0_["aniseed/local-fns"] = (module_23_0_["aniseed/local-fns"] or {})
  package.loaded[name_23_0_] = module_23_0_
  _0_0 = module_23_0_
end
local function _1_(...)
  _0_0["aniseed/local-fns"] = {require = {a = "conjure.aniseed.core", nvim = "conjure.aniseed.nvim", str = "conjure.aniseed.string"}}
  return {require("conjure.aniseed.core"), require("conjure.aniseed.nvim"), require("conjure.aniseed.string")}
end
local _2_ = _1_(...)
local a = _2_[1]
local nvim = _2_[2]
local str = _2_[3]
do local _ = ({nil, _0_0, {{}, nil}})[2] end
local env = nil
do
  local v_23_0_ = nil
  local function env0(k)
    local v = nvim.fn.getenv(k)
    if (a["string?"](v) and not a["empty?"](v)) then
      return v
    end
  end
  v_23_0_ = env0
  _0_0["aniseed/locals"]["env"] = v_23_0_
  env = v_23_0_
end
local config_dir = nil
do
  local v_23_0_ = nil
  do
    local v_23_0_0 = nil
    local function config_dir0()
      return ((env("XDG_CONFIG_HOME") or (env("HOME") .. "/.config")) .. "/conjure")
    end
    v_23_0_0 = config_dir0
    _0_0["config-dir"] = v_23_0_0
    v_23_0_ = v_23_0_0
  end
  _0_0["aniseed/locals"]["config-dir"] = v_23_0_
  config_dir = v_23_0_
end
local findfile = nil
do
  local v_23_0_ = nil
  do
    local v_23_0_0 = nil
    local function findfile0(name, path)
      local res = nvim.fn.findfile(name, path)
      if not a["empty?"](res) then
        return res
      end
    end
    v_23_0_0 = findfile0
    _0_0["findfile"] = v_23_0_0
    v_23_0_ = v_23_0_0
  end
  _0_0["aniseed/locals"]["findfile"] = v_23_0_
  findfile = v_23_0_
end
local resolve = nil
do
  local v_23_0_ = nil
  do
    local v_23_0_0 = nil
    local function resolve0(name)
      return (findfile(name, ".;") or findfile(name, (config_dir() .. ";")))
    end
    v_23_0_0 = resolve0
    _0_0["resolve"] = v_23_0_0
    v_23_0_ = v_23_0_0
  end
  _0_0["aniseed/locals"]["resolve"] = v_23_0_
  resolve = v_23_0_
end
local file_readable_3f = nil
do
  local v_23_0_ = nil
  do
    local v_23_0_0 = nil
    local function file_readable_3f0(path)
      return (1 == nvim.fn.filereadable(path))
    end
    v_23_0_0 = file_readable_3f0
    _0_0["file-readable?"] = v_23_0_0
    v_23_0_ = v_23_0_0
  end
  _0_0["aniseed/locals"]["file-readable?"] = v_23_0_
  file_readable_3f = v_23_0_
end
local split_path = nil
do
  local v_23_0_ = nil
  do
    local v_23_0_0 = nil
    local function split_path0(path)
      local function _3_(_241)
        return not a["empty?"](_241)
      end
      return a.filter(_3_, str.split(path, "/"))
    end
    v_23_0_0 = split_path0
    _0_0["split-path"] = v_23_0_0
    v_23_0_ = v_23_0_0
  end
  _0_0["aniseed/locals"]["split-path"] = v_23_0_
  split_path = v_23_0_
end
local join_path = nil
do
  local v_23_0_ = nil
  do
    local v_23_0_0 = nil
    local function join_path0(parts)
      return str.join("/", a.concat(parts))
    end
    v_23_0_0 = join_path0
    _0_0["join-path"] = v_23_0_0
    v_23_0_ = v_23_0_0
  end
  _0_0["aniseed/locals"]["join-path"] = v_23_0_
  join_path = v_23_0_
end
local resolve_relative = nil
do
  local v_23_0_ = nil
  do
    local v_23_0_0 = nil
    local function resolve_relative0(path, root)
      local function loop(parts)
        if a["empty?"](parts) then
          return path
        else
          if file_readable_3f(join_path(a.concat({root}, parts))) then
            return join_path(parts)
          else
            return loop(a.rest(parts))
          end
        end
      end
      return loop(split_path(path))
    end
    v_23_0_0 = resolve_relative0
    _0_0["resolve-relative"] = v_23_0_0
    v_23_0_ = v_23_0_0
  end
  _0_0["aniseed/locals"]["resolve-relative"] = v_23_0_
  resolve_relative = v_23_0_
end
return nil