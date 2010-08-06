require 'ruble'

command 'Flush Query Cache' do |cmd|
  cmd.scope = 'text.html'
  cmd.trigger = 'text.html'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke =<<-EOF
<?php $wpdb->flush(); ?>  
EOF
end
