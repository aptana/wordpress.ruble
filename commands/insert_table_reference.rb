require 'ruble'

command 'Insert Table Reference' do |cmd|
  cmd.scope = 'source.php'
  cmd.trigger = 'wpdb'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke do
    items = []
    constlist = [ '$wpdb->posts', '$wpdb->users', '$wpdb->categories', '$wpdb->post2cat' , '$wpdb->comments' , '$wpdb->links' , '$wpdb->linkcategories' , '$wpdb->options' , '$wpdb->postmeta']
    constlist.each {|f|
        items << { 
          'title' => f, 
          'insert' => f 
       }
    }
    
    if res = Ruble::UI.menu(items)
      '\\'+res['insert']
    else
      nil
    end
  end
end
