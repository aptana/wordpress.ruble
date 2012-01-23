require 'ruble'

command t(:navigation) do |cmd|
  cmd.scope = 'source.php'
  cmd.trigger = 'nav'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke do
    items = [
      { 'title' => 'Prev Post' , 'insert' => %^previous_post_link(${1:'${2:%link}', '${3:%title}', ${4:FALSE}, '${5:excluded_cat_ids}'}); ^},
      { 'title' => 'Next Post' , 'insert' => %^next_post_link(${1:'${2:%link}', '${3:%title}', ${4:FALSE}, '${5:excluded_cat_ids}'}); ^},
      { 'title' => 'Prev Posts' , 'insert' => %^previous_posts_link('${1:Next Entries &raquo;}') ^},
      { 'title' => 'Next Posts' , 'insert' => %^next_posts_link('${1:&laquo; Previous Entries}') ^},
      { 'title' => 'Posts Nav Link' , 'insert' => %^posts_nav_link('${1: &#183; }', '${2:previous page}', '${3:next page}'); ^}
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
