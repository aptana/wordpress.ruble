require 'ruble'

command t(:comments) do |cmd|
  cmd.scope = 'source.php'
  cmd.trigger = 'wpcomment'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke do
    scope = ENV['TM_SCOPE']
    if scope.include? 'source.php.embedded.block.html'
      'comments_template(); '
    else
      '<?php comments_template(); ?> '
    end
  end
end
