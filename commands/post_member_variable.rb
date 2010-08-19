require 'ruble'

command 'Post->Member Variable' do |cmd|
  cmd.scope = 'source.php'
  cmd.trigger = '$post'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke =<<-EOF
#!/usr/bin/env ruby
require ENV['TM_SUPPORT_PATH'] + '/lib/escape'
require ENV['TM_SUPPORT_PATH'] + '/lib/ui'

items = [
	 { 'title' => 'ID' , 'insert' => 'ID' }, 
	 { 'title' => 'Post Author' , 'insert' => 'post_author' }, 
	 { 'title' => 'Post Date' , 'insert' => 'post_date' }, 
	 { 'title' => 'Post Date GMT' , 'insert' => 'post_date_gmt' }, 
	 { 'title' => 'Content' , 'insert' => 'post_content' }, 
	 { 'title' => 'Title' , 'insert' => 'post_title' }, 
	 { 'title' => 'Category' , 'insert' => 'post_category' }, 
	 { 'title' => 'Excerpt' , 'insert' => 'post_excerpt' }, 
	 { 'title' => 'Status' , 'insert' => 'post_status' }, 
	 { 'title' => 'Comment Status' , 'insert' => 'comment_status' }, 
	 { 'title' => 'Ping Status' , 'insert' => 'ping_status' }, 
	 { 'title' => 'Post Password' , 'insert' => 'post_password' }, 
	 { 'title' => 'Post name (slug)' , 'insert' => 'post_name' }, 
	 { 'title' => 'to_ping' , 'insert' => 'to_ping' }, 
	 { 'title' => 'Pinged' , 'insert' => 'pinged' }, 
	 { 'title' => 'Post Modified' , 'insert' => 'post_modified' }, 
	 { 'title' => 'Post Modified_gmt' , 'insert' => 'post_modified_gmt' }, 
	 { 'title' => 'Post Content Filtered' , 'insert' => 'post_content_filtered' }, 
	 { 'title' => 'Post Parent' , 'insert' => 'post_parent' }, 
	 { 'title' => 'guid' , 'insert' => 'guid' }, 
	 { 'title' => 'Menu Order' , 'insert' => 'menu_order' }, 
	 { 'title' => 'Post Type' , 'insert' => 'post_type' }, 
	 { 'title' => 'Post MIME Type' , 'insert' => 'post_mime_type' }, 
	 { 'title' => 'Comment Count' , 'insert' => 'comment_count' }, 
	 { 'title' => 'View Count' , 'insert' => 'view_count' }, 
	 { 'title' => 'Ancestors' , 'insert' => 'ancestors' }
]
if res = TextMate::UI.menu(items)
  scope = ENV['TM_SCOPE']
  if scope.include? 'source.php' 
    print '\$post->' + res['insert']
  else
    print '<?php echo \$post->' + res['insert'] + "; ?>"
  end
end
EOF
end
