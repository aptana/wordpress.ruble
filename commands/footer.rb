require 'ruble'

command t(:footer) do |cmd|
  cmd.scope = 'source.php'
  cmd.trigger = 'wpfoot'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke do
    items = [
      { 'title' => 'Get Footer' , 'insert' => %^get_footer(); ^},
      { 'title' => 'Footer Hook' , 'insert' => %^wp_footer(); ^},
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
