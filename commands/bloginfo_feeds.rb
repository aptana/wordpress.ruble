require 'ruble'

command 'Bloginfo: Feeds' do |cmd|
  cmd.scope = 'source.php'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke =<<-EOF
#!/usr/bin/env ruby -wKU
require ENV['TM_SUPPORT_PATH'] + '/lib/escape'
require ENV['TM_SUPPORT_PATH'] + '/lib/ui'

items = [
  { 'title' => 'RDF',            'insert' => %^rdf_url^},
  { 'title' => 'RSS',            'insert' => %^rss_url^},
  { 'title' => 'RSS2',           'insert' => %^rss2_url^},
  { 'title' => 'ATOM',           'insert' => %^atom_url^},
  { 'title' => 'Comments RSS2',  'insert' => %^comments_rss2_url^},
  { 'title' => 'Pingback URL',   'insert' => %^pingback_url^}
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
