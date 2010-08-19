require 'ruble'

command 'Localize var' do |cmd|
  cmd.key_binding = 'M3+M2+L'
  cmd.scope = 'source.php'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke do
    scope = ENV['TM_SCOPE']
    if scope.include? 'source.php.embedded.block.html'
      '__($TM_SELECTED_TEXT)'
    else
      '<?php __($TM_SELECTED_TEXT) ?>'
    end
  end
end
