require 'ruble'

command 'Bloginfo: Feeds' do |cmd|
  cmd.scope = 'source.php'
  cmd.trigger = 'blog'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke do
    items = [
      { 'title' => 'RDF',            'insert' => %^rdf_url^},
      { 'title' => 'RSS',            'insert' => %^rss_url^},
      { 'title' => 'RSS2',           'insert' => %^rss2_url^},
      { 'title' => 'ATOM',           'insert' => %^atom_url^},
      { 'title' => 'Comments RSS2',  'insert' => %^comments_rss2_url^},
      { 'title' => 'Pingback URL',   'insert' => %^pingback_url^}
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
