require 'ruble'

command 'Footer' do |cmd|
  cmd.scope = 'source.php'
  cmd.trigger = 'wpfoot'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke =<<-EOF
#!/usr/bin/env ruby -wKU
require ENV['TM_SUPPORT_PATH'] + '/lib/escape'
require ENV['TM_SUPPORT_PATH'] + '/lib/ui'

items = [
  { 'title' => 'Get Footer' , 'insert' => %^get_footer(); ^},
  { 'title' => 'Footer Hook' , 'insert' => %^wp_footer(); ^},
]

if res = TextMate::UI.menu(items)
  scope = ENV['TM_SCOPE']
  if scope.include? 'source.php' 
    print res['insert']
  else
    print "<?php " + res['insert'] + "?>"
  end
end
EOF
end
