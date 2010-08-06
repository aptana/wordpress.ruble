require 'ruble'

command 'Comment:' do |cmd|
  cmd.scope = 'text.html'
  cmd.trigger = 'text.html'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke =<<-EOF
#!/usr/bin/env ruby -wKU
require ENV['TM_SUPPORT_PATH'] + '/lib/escape'
require ENV['TM_SUPPORT_PATH'] + '/lib/ui'

items = [
	{ 'title' => 'ID',						      'insert' => %^comment_ID(); ^},
	{ 'title' => 'Author',						  'insert' => %^comment_author(); ^},
	{ 'title' => 'Content',					    'insert' => %^comment_text(); ^},
	{ 'title' => 'Date',					      'insert' => %^comment_date('${1:F jS, Y}'); ^},
	{ 'title' => 'Time',					      'insert' => %^comment_time(); ^},
	{ 'title' => 'Edit', 					      'insert' => %^edit_comment_link('${1:edit}','${2:&nbsp;&nbsp;}','$3'); ^},
	{ 'title' => 'Author Link',				  'insert' => %^comment_author_link(); ^},
	{ 'title' => 'Author URL',				  'insert' => %^comment_author_url(); ^},
	{ 'title' => 'Author IP',				    'insert' => %^comment_author_IP(); ^},
	{ 'title' => 'Author E-mail',		    'insert' => %^comment_author_email(); ^},
	{ 'title' => 'Awaiting Moderation',	'insert' => %^if (\\$comment->comment_approved == '0') { echo '<em>Your comment is awaiting moderation.</em>'; }^},
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
