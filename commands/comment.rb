require 'ruble'

command t(:comment) do |cmd|
  cmd.scope = 'source.php'
  cmd.trigger = 'comment'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke do
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
    
    if res = Ruble::UI.menu(items)
      scope = ENV['TM_SCOPE']
      if scope.include? 'source.php.embedded.block.html'
        res['insert']
      else
        "<?php " + res['insert'] + "?>"
      end
    else
      nil
    end
  end
end
