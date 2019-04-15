puts "in cucumber: First load this file"

@yaml_exists = false
backward_path = '../.' #go back -> emarsys/support/features/workspace
rel_path = File.join(File.expand_path(backward_path), 'emarsys_accounts.yml')
puts "> required YAML-File should be in #{rel_path}"
yaml_exists = File.file?(rel_path)
if (yaml_exists)
  @yaml_exists = true
  puts "YAML exists"
end
