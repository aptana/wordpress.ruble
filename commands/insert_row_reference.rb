require 'ruble'

command 'Insert Row Reference' do |cmd|
  cmd.scope = 'text.html'
  cmd.trigger = 'text.html'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke =<<-EOF
#!/usr/bin/env ruby -wKU
require ENV['TM_SUPPORT_PATH'] + '/lib/escape'
require ENV['TM_SUPPORT_PATH'] + '/lib/ui'

categories =      ['cat_ID','cat_name','category_nicename','category_description','category_parent','category_count']
comments =        ['comment_ID','comment_post_ID','comment_author','comment_author_email','comment_author_url','comment_author_IP','comment_date','comment_date_gmt','comment_content','comment_karma','comment_approved','comment_agent','comment_type','comment_parent','user_id']
linkcategories =  ['cat_id','cat_name','auto_toggle','show_images','show_description','show_rating','show_updated','sort_order','sort_desc','text_before_link','text_after_link','text_after_all','list_limit']
links =           ['link_id','link_url','link_name','link_image','link_target','link_category','link_description','link_visible','link_owner','link_rating','link_updated','link_rel','link_notes','link_rss']
options =         ['option_id','blog_id','option_name','option_can_override','option_type','option_value','option_width','option_height','option_description','option_admin_level','autoload']
post2cat =        ['rel_id','post_id','category_id']
postmeta =        ['meta_id','post_id','meta_key','meta_value']
posts =           ['ID','post_author','post_date','post_date_gmt','post_content','post_title','post_category','post_excerpt','post_status','comment_status','ping_status','post_password','post_name','to_ping','pinged','post_modified','post_modified_gmt','post_content_filtered','post_parent','guid','menu_order','post_type','post_mime_type','comment_count']
usermeta =        ['umeta_id','user_id','meta_key','meta_value']
users =           ['ID','user_login','user_pass','user_nicename','user_email','user_url','user_registered','user_level','user_activation_key','user_status','display_name']

tables = [
  { 'title' => 'Categories' , 'secondary' => categories },
  { 'title' => 'Comments' , 'secondary' => comments },
  { 'title' => 'Link Categories' , 'secondary' => linkcategories },
  { 'title' => 'Links' , 'secondary' => links },
  { 'title' => 'Options' , 'secondary' => options },
  { 'title' => 'Post2Cat' , 'secondary' => post2cat },
  { 'title' => 'Post Meta' , 'secondary' => postmeta },
  { 'title' => 'Posts' , 'secondary' => posts },
  { 'title' => 'User Meta' , 'secondary' => usermeta },
  { 'title' => 'Users' , 'secondary' => users },
]

if res = TextMate::UI.menu(tables)
  rows = []
  res['secondary'].each {|x|
    rows << { 'title'=>x , 'insert'=>x }
  }
  if res2 = TextMate::UI.menu(rows)
    print res2['insert']
  end
end
EOF
end
