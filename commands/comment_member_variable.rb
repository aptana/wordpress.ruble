require 'ruble'

command 'Comment->Member Variable' do |cmd|
  cmd.scope = 'source.php'
  cmd.trigger = '$comment'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke =<<-EOF
#!/usr/bin/env ruby
require ENV['TM_SUPPORT_PATH'] + '/lib/escape'
require ENV['TM_SUPPORT_PATH'] + '/lib/ui'

items = [
	 { 'title' => 'comment_ID' ,            'insert' => 'comment_ID' },
	 { 'title' => 'comment_post_ID' ,       'insert' => 'comment_post_ID' },
	 { 'title' => 'comment_approved' ,      'insert' => 'comment_approved' },
	 { 'title' => 'comment_author' ,        'insert' => 'comment_author' },
	 { 'title' => 'comment_author_email' ,  'insert' => 'comment_author_email' },
	 { 'title' => 'comment_author_url' ,    'insert' => 'comment_author_url' },
	 { 'title' => 'comment_author_IP' ,     'insert' => 'comment_author_IP' },
	 { 'title' => 'user_id' ,               'insert' => 'user_id' },
	 { 'title' => 'comment_date' ,          'insert' => 'comment_date' },
	 { 'title' => 'comment_date_gmt' ,      'insert' => 'comment_date_gmt' },
	 { 'title' => 'comment_content' ,       'insert' => 'comment_content' },
	 { 'title' => 'comment_karma' ,         'insert' => 'comment_karma' },
	 { 'title' => 'comment_agent' ,         'insert' => 'comment_agent' },
	 { 'title' => 'comment_type' ,          'insert' => 'comment_type' },
	 { 'title' => 'comment_parent' ,        'insert' => 'comment_parent' },
	 { 'title' => 'comment_subscribe' ,     'insert' => 'comment_subscribe' },
]
if res = TextMate::UI.menu(items)
  scope = ENV['TM_SCOPE']
  if scope.include? 'source.php' 
    print '\$comment->' + res['insert']
  else
    print '<?php echo \$comment->' + res['insert'] + "; ?>"
  end
end
EOF
end
