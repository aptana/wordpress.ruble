require 'ruble'

command 'Flush Query Cache' do |cmd|
  cmd.scope = 'source.php'
  cmd.trigger = 'flush'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke { "<?php $wpdb->flush(); ?>" }
end
