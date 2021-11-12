local PluginConfig = {
  ['Name'] = 'RPM';
  ['Permissions'] = { 'domain@192.168.1.1' };
}

if not plugin then
  error('Cannot load plugin without plugin var')
end
require(
  script.Parent:FindFirstChild(
    'RPM.PluginLibrary'
  ).Main
):Load(PluginConfig, plugin, script.Parent);
