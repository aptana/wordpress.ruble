require 'ruble'

command t(:insert_constant) do |cmd|
  cmd.scope = 'source.php'
  cmd.trigger = 'const'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke do
    items = []
    constlist = [ 'ABSPATH', 'ARRAY_A', 'ARRAY_N', 'ATOM' , 'CACHE_SERIAL_FOOTER' , 'CACHE_SERIAL_HEADER' , 'CASE_LOWER' , 'CASE_UPPER' , 'COMMENTS_TEMPLATE' , 'COOKIEHASH' , 'COOKIEPATH' , 'COOKIE_DOMAIN' , 'CUSTOM_TAGS' , 'DB_HOST' , 'DB_NAME' , 'DB_PASSW' , 'DB_PASSWORD' , 'DB_USER' , 'DOING_AJAX' , 'DOING_CRON' , 'EP_ALL' , 'EP_ATTACHMENT' , 'EP_AUTHORS' , 'EP_CATEGORIES' , 'EP_COMMENTS' , 'EP_DATE' , 'EP_DAY' , 'EP_MONTH' , 'EP_NONE' , 'EP_PAGES' , 'EP_PERMALINK' , 'EP_ROOT' , 'EP_SEARCH' , 'EP_YEAR' , 'EZSQL_VERSION' , 'MAGPIE_CACHE_AGE' , 'MAGPIE_CACHE_DIR' , 'MAGPIE_CACHE_FRESH_ONLY' , 'MAGPIE_CACHE_ON' , 'MAGPIE_DEBUG' , 'MAGPIE_FETCH_TIME_OUT' , 'MAGPIE_INITIALIZED' , 'MAGPIE_USER_AGENT' , 'MAGPIE_USE_GZIP' , 'OBJECT' , 'PASS_COOKIE' , 'ROWS_PER_SEGMENT' , 'RSS' , 'SAVEQUERIES' , 'SITECOOKIEPATH' , 'TEMPLATEPATH' , 'USER_COOKIE' , 'WPINC' , 'WPLANG' , 'WP_BACKUP_DIR' , 'WP_IMPORTING' , 'WP_INSTALLING' , 'WP_USE_THEMES' , 'XMLRPC_REQUEST']
    constlist.each {|f|
        items << { 
          'title' => f, 
          'insert' => f 
       }
    }
    
    if res = Ruble::UI.menu(items)
      res['insert']
    else
      nil
    end
  end
end
