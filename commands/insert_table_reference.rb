require 'ruble'

command 'Insert Table Reference' do |cmd|
  cmd.scope = 'text.html'
  cmd.trigger = 'text.html'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke =<<-EOF
#!/usr/bin/env ruby -wKU
require ENV['TM_SUPPORT_PATH'] + '/lib/escape'
require ENV['TM_SUPPORT_PATH'] + '/lib/ui'

items = []
constlist = [ '$wpdb->posts', '$wpdb->users', '$wpdb->categories', '$wpdb->post2cat' , '$wpdb->comments' , '$wpdb->links' , '$wpdb->linkcategories' , '$wpdb->options' , '$wpdb->postmeta']
constlist.each {|f|
    items << { 
      'title' => f, 
      'insert' => f 
   }
}

if res = TextMate::UI.menu(items)
  print '\\'+res['insert']
end
EOF
end
