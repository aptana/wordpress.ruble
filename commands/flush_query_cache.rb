require 'ruble'

command t(:flush_query_cache) do |cmd|
  cmd.scope = 'source.php'
  cmd.trigger = 'flush'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke { "<?php $wpdb->flush(); ?>" }
end
