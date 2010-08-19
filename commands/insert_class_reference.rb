require 'ruble'

command 'Insert Class Reference' do |cmd|
  cmd.scope = 'source.php'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke =<<-EOF
#!/usr/bin/env ruby -wKU
require ENV['TM_SUPPORT_PATH'] + '/lib/escape'
require ENV['TM_SUPPORT_PATH'] + '/lib/ui'

items = []
constlist = [ '$wpdb->show_errors' , '$wpdb->num_queries' , '$wpdb->last_results' , '$wpdb->last_query' , '$wpdb->queries' , '$wpdb->col_info' , '$wpdb->insert_id']
constlist.each {|f|
    items << { 
      'title' => f, 
      'insert' => f 
   }
}

if res = TextMate::UI.menu(items)
  scope = ENV['TM_SCOPE']
  if scope.include? 'source.php' 
    print '\\'+res['insert']
  else
    print "<?php echo \\" + res['insert'] + "; ?>"
  end
end
EOF
end
