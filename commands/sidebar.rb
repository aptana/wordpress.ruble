require 'ruble'

command 'Sidebar' do |cmd|
  cmd.scope = 'source.php'
  cmd.trigger = 'wpside'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke do
    scope = ENV['TM_SCOPE']
    if scope.include? 'source.php.embedded.block.html' 
      'get_sidebar(); '
    else
      '<?php get_sidebar(); ?> '
    end
  end
end
