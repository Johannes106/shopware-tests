# puts "in cucumber: First load this file"
# #only load this file on start if $yaml_exists==true because the files in support-folder will be load on start of cucumber (before loading feature-files) and then there will be thrown an error if no yaml exist
# #set value of @yaml_exist in newsletter.rb
# $yaml_exists = false
# backward_path = '../.' #go back -> emarsys/support/features/workspace
# rel_path = File.join(File.expand_path(backward_path), 'emarsys_accounts.yml')
# puts "> required YAML-File should be in #{rel_path}"
# yaml_exists = File.file?(rel_path)
# if (yaml_exists)
#   $yaml_exists = true
#   puts "YAML exists"
# end
