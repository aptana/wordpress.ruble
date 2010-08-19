require 'ruble'

command 'Comments' do |cmd|
  cmd.scope = 'source.php'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke =<<-EOF
#!/usr/bin/env ruby
scope = ENV['TM_SCOPE']
if scope.include? 'source.php' 
  print 'comments_template(); '
else
  print '<?php comments_template(); ?> '
end
EOF
end
