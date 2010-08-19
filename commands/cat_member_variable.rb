require 'ruble'

command 'Cat->Member Variable' do |cmd|
  cmd.scope = 'source.php'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke =<<-EOF
#!/usr/bin/env ruby
require ENV['TM_SUPPORT_PATH'] + '/lib/escape'
require ENV['TM_SUPPORT_PATH'] + '/lib/ui'

items = [
  { 'title' => 'ID',               'insert' => 'cat_ID' },
  { 'title' => 'Name',             'insert' => 'cat_name' },
  { 'title' => 'Nice Name (slug)', 'insert' => 'category_nicename' },
  { 'title' => 'Description',      'insert' => 'category_description' },
  { 'title' => 'Parent',           'insert' => 'category_parent' }
]
if res = TextMate::UI.menu(items)
  scope = ENV['TM_SCOPE']
  if scope.include? 'source.php' 
    print '\$cat->' + res['insert']
  else
    print '<?php echo \$cat->' + res['insert'] + "; ?>"
  end
end
EOF
end
