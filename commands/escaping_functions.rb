require 'ruble'

command 'Escaping functions' do |cmd|
  cmd.scope = 'text.html'
  cmd.trigger = 'text.html'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke =<<-EOF
#!/usr/bin/env ruby
require ENV['TM_SUPPORT_PATH'] + '/lib/escape'
require ENV['TM_SUPPORT_PATH'] + '/lib/ui'

items = [
  { 'title' => 'attr',      'insert' => %^esc_attr(${1:}); ^},
  { 'title' => 'attr echo', 'insert' => %^esc_attr_e(${1:}); ^},
  { 'title' => 'html',      'insert' => %^esc_html(${1:}); ^},
  { 'title' => 'html echo', 'insert' => %^esc_html_e(${1:}); ^},
  { 'title' => 'sql',       'insert' => %^esc_sql(${1:}); ^},
  { 'title' => 'url',       'insert' => %^esc_url(${1:}); ^},
  { 'title' => 'url_raw',   'insert' => %^esc_url_raw(${1:}); ^},
  { 'title' => 'js',        'insert' => %^esc_js(${1:}); ^},
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
