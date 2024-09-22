if os.getenv('HOSTNAME') ~= 'gertrude' then
  return
end

local port = os.getenv('GDScript_Port') or '6005'
--
-- local handle = io.popen("lsof -i:" .. port)
-- local result = handle:read("*a")
-- handle:close()
--
local cmd = vim.lsp.rpc.connect('127.0.0.1', tonumber(port))
-- local pipe = '/tmp/godot.pipe'

vim.lsp.start({
  name = 'Godot',
  cmd = cmd,
  root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
  -- on_attach = function(client, bufnr)
  --   if result == "" then
  --       vim.api.nvim_command('echo serverstart("' .. pipe .. '")')
  --   end
  -- end
})

