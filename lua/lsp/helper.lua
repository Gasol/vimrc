
local helper = {}

local function which(executable)
  local cmd = 'command -v ' .. executable
  local handle = io.popen(cmd)
  local result = handle:read('*a')
  handle:close()
  result = string.gsub(result, '\n+$', '')
  return result
end

function helper.find_sumneko_executable(env_name)
  env_name = env_name or 'SUMNEKO_LUA_ROOT_DIR'
  local root_dir, executable_path
  root_dir = os.getenv(env_name)
  if executable_path == nil or executable_path == '' then
    executable_path = which('lua-language-server')
  else
    local system_name
    if vim.fn.has("mac") == 1 then
      system_name = "macOS"
    elseif vim.fn.has("unix") == 1 then
      system_name = "Linux"
    elseif vim.fn.has('win32') == 1 then
      system_name = "Windows"
    else
      print("Unsupported system for sumneko")
    end
    executable_path = root_dir.."/bin/"..system_name.."/lua-language-server"
  end
  return executable_path
end

return helper
