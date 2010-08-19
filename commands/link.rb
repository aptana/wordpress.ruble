require 'ruble'

command 'Link:' do |cmd|
  cmd.scope = 'source.php'
  cmd.trigger = 'wplink'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke do
    items = [
      { 'title' => 'Post / Page',	'insert' => %^get_permalink(${0:\\$post->ID}); ^},
      { 'title' => 'Category',		'insert' => %^get_category_link(${0:\\$cat}); ^},
      { 'title' => 'Tag',           'insert' => %^get_tag_link(${0:\\$tag_id}); ^},
    ]
    
    if res = Ruble::UI.menu(items)
      scope = ENV['TM_SCOPE']
      if scope.include? 'source.php.embedded.block.html'
        res['insert']
      else
        "<?php echo " + res['insert'] + "?>"
      end
    else
      nil
    end
  end
end
