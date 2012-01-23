require 'ruble'

command t(:author_meta) do |cmd|
  cmd.scope = 'source.php'
  cmd.trigger = 'author'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke do
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
    
    if res = Ruble::UI.menu(items)
      scope = ENV['TM_SCOPE']
      if res['self'] != true
        res['insert'] = "${1:get_}the_author_meta('" + res['insert'] + "');"
      end
      if scope.include? 'source.php.embedded.block.html'
        res['insert']
      else
        "<?php " + res['insert'] + " ?>"
      end
    else
      nil
    end
  end
end
