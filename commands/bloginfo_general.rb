require 'ruble'

command 'Bloginfo: General' do |cmd|
  cmd.scope = 'source.php'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke =<<-EOF
#!/usr/bin/env ruby
require ENV['TM_SUPPORT_PATH'] + '/lib/escape'
require ENV['TM_SUPPORT_PATH'] + '/lib/ui'

items = [
  { 'title' => 'Name',                  'insert' => %^name^},
  { 'title' => 'Description',           'insert' => %^description^},
  { 'title' => 'URL',                   'insert' => %^url^},
  { 'title' => 'WP URL',                'insert' => %^wpurl^},
  { 'title' => 'Template URL',          'insert' => %^template_url^},
  { 'title' => 'Stylesheet URL',        'insert' => %^stylesheet_url^},
  { 'title' => 'Admin Email',           'insert' => %^admin_email^},
  { 'title' => 'Language',              'insert' => %^language^},
  { 'title' => 'Charset',               'insert' => %^charset^},
  { 'title' => 'HTML Type',             'insert' => %^html_type^},
  { 'title' => 'Version',               'insert' => %^version^},
]

if res = TextMate::UI.menu(items)
  scope = ENV['TM_SCOPE']
  if scope.include? 'source.php' 
    print "${1:get_}bloginfo('" + res['insert'] + "'); "
  else
    print "<?php ${1:get_}bloginfo('" + res['insert'] + "'); ?>"
  end
end
EOF
end
