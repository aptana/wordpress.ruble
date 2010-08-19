require 'ruble'

command 'Insert Condition' do |cmd|
  cmd.scope = 'source.php'
  cmd.trigger = 'is'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke do
    items = [
      { 'title' => 'In Category?' , 'insert' => 'in_category(${1:1}); $0' },
      { 'title' => 'Is Single?' , 'insert' => 'is_single($1); $0' },
      { 'title' => 'Is Home?' , 'insert' => 'is_home(); ' },
      { 'title' => 'Is Front Page?' , 'insert' => 'is_front_page(); ' },
      { 'title' => 'Is Page?' , 'insert' => 'is_page($1); $0' },
      { 'title' => 'Is Category?' , 'insert' => 'is_category($1); $0' },
      { 'title' => 'Is Tag?' , 'insert' => 'is_tag($1); $0' },
      { 'title' => 'Is Author?' , 'insert' => 'is_author($1); $0' },
      { 'title' => 'Is Search?' , 'insert' => 'is_search(); ' },
      { 'title' => 'Is Feed?' , 'insert' => 'is_feed(); ' },
      { 'title' => 'Is Date?' , 'insert' => 'is_date(); ' },
      { 'title' => 'Is Year?' , 'insert' => 'is_year(); ' },
      { 'title' => 'Is Month?' , 'insert' => 'is_month(); ' },
      { 'title' => 'Is Day?' , 'insert' => 'is_day();' },
      { 'title' => 'Is Time?' , 'insert' => 'is_time();' },
      { 'title' => 'Is 404?' , 'insert' => 'is_404(); ' },
      { 'title' => 'Is Archive?' , 'insert' => 'is_archive();' },
      { 'title' => 'Is Attachment?' , 'insert' => 'is_attachment();' },
      { 'title' => 'Is Trackback?' , 'insert' => 'is_trackback();' },
      { 'title' => 'Is Preview?' , 'insert' => 'is_preview();' }
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
