require 'ruble'

command 'Post:' do |cmd|
  cmd.scope = 'text.html'
  cmd.trigger = 'text.html'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke =<<-EOF
#!/usr/bin/env ruby -wKU
require ENV['TM_SUPPORT_PATH'] + '/lib/escape'
require ENV['TM_SUPPORT_PATH'] + '/lib/ui'

items = [
  { 'title' => 'ID' , 'insert' => %^the_ID(); ^},
  { 'title' => 'Content' , 'insert' => %^${1:get_}the_content(${2:"Continue reading " . the_title('', '', false)}); ^},
  { 'title' => 'Excerpt' , 'insert' => %^${1:get_}the_excerpt(); ^},
  { 'title' => 'Permalink' , 'insert' => %^the_permalink(); ^},
  { 'title' => 'Get Permalink' , 'insert' => %^get_permalink() ^},
  { 'title' => 'Edit Post Link' , 'insert' => %^edit_post_link('${1:Edit this page}', '${2:<small>}', '${3:</small>}'); ^},
  { 'title' => 'Title' , 'insert' => %^${1:get_}the_title(${2:'<${3:h3}>', '</${3/\s.*//}>', ${4:TRUE}}); ^},
  { 'title' => 'Title RSS' , 'insert' => %^the_title_rss(); ^},
  { 'title' => 'Date' , 'insert' => %^the_time('${1:F jS, Y}') ^},
  { 'title' => 'Meta' , 'insert' => %^the_meta(); ^},
  { 'title' => 'Author' , 'insert' => %^the_author() ^},
  { 'title' => 'Category' , 'insert' => %^the_category('${1:, }') ^},
  { 'title' => 'Comments' , 'insert' => %^comments_popup_link('${1:No Comments &#187;}', '${2:1 Comment &#187;}', '${3:% Comments &#187;}'); ^},
  { 'title' => 'Content RSS' , 'insert' => %^the_content_rss('${1:${2:More...}', ${3:strip_teaser}, '${4:more_file}', ${5:50}, ${6:encode_html}}); ^},
  { 'title' => 'Excerpt RSS' , 'insert' => %^the_excerpt_rss(); ^}
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
