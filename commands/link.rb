require 'ruble'

command 'Link:' do |cmd|
  cmd.scope = 'text.html'
  cmd.trigger = 'text.html'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke =<<-EOF
#!/usr/bin/env ruby -wKU
require ENV['TM_SUPPORT_PATH'] + '/lib/escape'
require ENV['TM_SUPPORT_PATH'] + '/lib/ui'

items = [
  { 'title' => 'Post / Page',	'insert' => %^get_permalink(${0:\\$post->ID}); ^},
  { 'title' => 'Category',		'insert' => %^get_category_link(${0:\\$cat}); ^},
  { 'title' => 'Tag',           'insert' => %^get_tag_link(${0:\\$tag_id}); ^},
]

if res = TextMate::UI.menu(items)
  scope = ENV['TM_SCOPE']
  if scope.include? 'source.php' 
    print res['insert']
  else
    print "<?php echo " + res['insert'] + "?>"
  end
end
EOF
end
