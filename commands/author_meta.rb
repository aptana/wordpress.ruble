require 'ruble'

command 'Author Meta' do |cmd|
  cmd.scope = 'text.html'
  cmd.trigger = 'text.html'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke =<<-EOF
#!/usr/bin/env ruby
require ENV['TM_SUPPORT_PATH'] + '/lib/escape'
require ENV['TM_SUPPORT_PATH'] + '/lib/ui'

items = [
  { 'title' => 'Display Name',          'insert' => %^display_name^},
  { 'title' => 'Homepage',              'insert' => %^user_url^},
  { 'title' => 'Email',                 'insert' => %^user_email^},
  { 'title' => 'Login',                 'insert' => %^user_login^},
  { 'title' => 'Posts Link',            'insert' => %^the_author_posts_link();^,  'self' => true},
  { 'title' => 'Number of posts',       'insert' => %^${1:get_}the_author_posts();^, 'self' => true},
  { 'title' => 'First Name',            'insert' => %^first_name^},
  { 'title' => 'Last Name',             'insert' => %^last_name^},
  { 'title' => 'Description',           'insert' => %^description^},
  { 'title' => 'Nice Name / Slug',      'insert' => %^user_nice_name^},
  { 'title' => 'Registered Since',      'insert' => %^user_registered^},
  { 'title' => 'User Level',            'insert' => %^user_level^},
]

if res = TextMate::UI.menu(items)
  scope = ENV['TM_SCOPE']
  if res['self'] != true
      res['insert'] = "${1:get_}the_author_meta('" + res['insert'] + "');"
  end
  if scope.include? 'source.php' 
    print res['insert']
  else
    print "<?php " + res['insert'] + " ?>"
  end
end
EOF
end
