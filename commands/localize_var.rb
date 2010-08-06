require 'ruble'

command 'Localize var' do |cmd|
  cmd.key_binding = 'M3+M2+L'
  cmd.scope = 'text.html'
  cmd.output = :insert_as_snippet
  cmd.input = :none, :none
  cmd.invoke =<<-EOF
#!/usr/bin/env ruby
scope = ENV['TM_SCOPE']
if scope.include? 'source.php' 
  print '__($TM_SELECTED_TEXT)'
else
  print '<?php __($TM_SELECTED_TEXT) ?>'
end

EOF
end
