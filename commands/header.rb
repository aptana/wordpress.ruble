require 'ruble'

command t(:header) do |cmd|
  cmd.scope = 'source.php'
  cmd.trigger = 'wphead'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke do
    items = [
      { 'title' => 'Get Header' , 'insert' => %^get_header(); ^},
      { 'title' => 'Header Hook' , 'insert' => %^wp_head(); ^},
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
