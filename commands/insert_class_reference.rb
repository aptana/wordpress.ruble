require 'ruble'

command t(:insert_class_reference) do |cmd|
  cmd.scope = 'source.php'
  cmd.trigger = 'wpdb'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke do
    items = []
    constlist = [ '$wpdb->show_errors' , '$wpdb->num_queries' , '$wpdb->last_results' , '$wpdb->last_query' , '$wpdb->queries' , '$wpdb->col_info' , '$wpdb->insert_id']
    constlist.each {|f|
        items << { 
          'title' => f, 
          'insert' => f 
       }
    }
    
    if res = Ruble::UI.menu(items)
      scope = ENV['TM_SCOPE']
      if scope.include? 'source.php.embedded.block.html'
        '\\'+res['insert']
      else
        "<?php echo \\" + res['insert'] + "; ?>"
      end
    else
      nil
    end
  end
end
