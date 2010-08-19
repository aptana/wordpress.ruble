require 'ruble'

command 'Flush Query Cache' do |cmd|
  cmd.scope = 'source.php'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke =<<-EOF
<?php $wpdb->flush(); ?>  
EOF
end
