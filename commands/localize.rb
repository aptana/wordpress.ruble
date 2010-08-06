require 'ruble'

command 'Localize' do |cmd|
  cmd.key_binding = 'M3+L'
  cmd.scope = 'text.html'
  cmd.output = :insert_as_snippet
  cmd.input = :none, :none
  cmd.invoke =<<-EOF
#!/usr/bin/env ruby
scope = ENV['TM_SCOPE']
if scope.include? 'source.php' 
  print '_e("$TM_SELECTED_TEXT");'
else
  print '<?php _e("$TM_SELECTED_TEXT"); ?>'
end
EOF
end
