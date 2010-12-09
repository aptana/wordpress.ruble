require 'ruble'

command 'Localize' do |cmd|
  cmd.scope = 'source.php'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke do
    scope = ENV['TM_SCOPE']
    if scope.include? 'source.php.embedded.block.html'
      '_e("$TM_SELECTED_TEXT");'
    else
      '<?php _e("$TM_SELECTED_TEXT"); ?>'
    end
  end
end
