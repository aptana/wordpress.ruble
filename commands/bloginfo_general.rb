require 'ruble'

command t(:bloginfo_general) do |cmd|
  cmd.scope = 'source.php'
  cmd.trigger = 'blog'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke do
    items = [
      { 'title' => 'Name',                  'insert' => %^name^},
      { 'title' => 'Description',           'insert' => %^description^},
      { 'title' => 'URL',                   'insert' => %^url^},
      { 'title' => 'WP URL',                'insert' => %^wpurl^},
      { 'title' => 'Template URL',          'insert' => %^template_url^},
      { 'title' => 'Stylesheet URL',        'insert' => %^stylesheet_url^},
      { 'title' => 'Admin Email',           'insert' => %^admin_email^},
      { 'title' => 'Language',              'insert' => %^language^},
      { 'title' => 'Charset',               'insert' => %^charset^},
      { 'title' => 'HTML Type',             'insert' => %^html_type^},
      { 'title' => 'Version',               'insert' => %^version^},
    ]
    
    if res = Ruble::UI.menu(items)
      scope = ENV['TM_SCOPE']
      if scope.include? 'source.php.embedded.block.html'
        "${1:get_}bloginfo('" + res['insert'] + "'); "
      else
        "<?php ${1:get_}bloginfo('" + res['insert'] + "'); ?>"
      end
    else
      nil
    end
  end
end
