require 'ruble'

command 'Cat->Member Variable' do |cmd|
  cmd.scope = 'source.php'
  cmd.trigger = '$cat'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke do
    items = [
      { 'title' => 'ID',               'insert' => 'cat_ID' },
      { 'title' => 'Name',             'insert' => 'cat_name' },
      { 'title' => 'Nice Name (slug)', 'insert' => 'category_nicename' },
      { 'title' => 'Description',      'insert' => 'category_description' },
      { 'title' => 'Parent',           'insert' => 'category_parent' }
    ]
    if res = Ruble::UI.menu(items)
      scope = ENV['TM_SCOPE']
      if scope.include? 'source.php.embedded.block.html'
        '\$cat->' + res['insert']
      else
        '<?php echo \$cat->' + res['insert'] + "; ?>"
      end
    else
      nil
    end
  end
end
