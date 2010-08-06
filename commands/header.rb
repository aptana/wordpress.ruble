require 'ruble'

command 'Header' do |cmd|
  cmd.scope = 'text.html'
  cmd.trigger = 'text.html'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke =<<-EOF
#!/usr/bin/env ruby -wKU
require ENV['TM_SUPPORT_PATH'] + '/lib/escape'
require ENV['TM_SUPPORT_PATH'] + '/lib/ui'

items = [
  { 'title' => 'Get Header' , 'insert' => %^get_header(); ^},
  { 'title' => 'Header Hook' , 'insert' => %^wp_head(); ^},
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
