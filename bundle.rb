require 'ruble'

bundle do |bundle|
  bundle.display_name = t(:bundle_name)
  bundle.author = 'Joost de Valk, Brett Terpstra'
  bundle.description =  <<END
Wordpress Ruble converted from TextMate bundle. TM Bundle by:
http://yoast.com/tools/textmate/ - Joost de Valk
http://blog.circlesixdesign.com/ - Brett Terpstra
END

  bundle.repository = 'git://github.com/aptana/wordpress.ruble.git'

  bundle.menu t(:bundle_name) do |main_menu|
    main_menu.menu t(:structure) do |submenu|
      submenu.command t(:sidebar)
      submenu.command t(:comments)
      submenu.command t(:html_body_tag)
      submenu.command t(:footer)
      submenu.command t(:header)
    end
    main_menu.menu t(:loop) do |submenu|
      submenu.command t(:comment)
      submenu.command t(:author_meta)
      submenu.command t(:loop)
      submenu.command t(:headline)
      submenu.separator
      submenu.command t(:post)
      submenu.command t(:navigation)
      submenu.separator
      submenu.command t(:query_posts)
      submenu.command t(:flush_query_cache)
      submenu.command t(:insert_class_reference)
      submenu.command t(:insert_table_reference)
      submenu.command t(:insert_row_reference)
      submenu.separator
      submenu.command t(:insert_constant)
      submenu.command t(:insert_condition)
      submenu.separator
      submenu.command t(:bloginfo_general)
      submenu.command t(:bloginfo_feeds)
      #submenu.menu 'Navigation' do |submenu|
      #end
    end
    main_menu.menu t(:categories) do |submenu|
      submenu.command t(:list_categories_wp)
      submenu.command t(:list_categories_full_options)
      submenu.command t(:get_category_parents)
      submenu.command t(:get_category)
      submenu.command t(:cat_member_variable)
    end
    main_menu.menu t(:plugins) do |submenu|
      submenu.command t(:filter)
      submenu.command t(:action)
    end
    main_menu.menu t(:other) do |submenu|
      submenu.command t(:escaping_functions)
      submenu.command t(:single_post_title)
      submenu.command t(:post_member_variable)
      submenu.command t(:comment_member_variable)
      submenu.command t(:get_archives)
      submenu.command t(:wp_redirect)
      submenu.command t(:link)
    end
    main_menu.menu t(:plugin_creation) do |submenu|
      submenu.command t(:widget)
      submenu.command t(:readme_txt)
      submenu.command t(:plugin_with_gpl)
      submenu.command t(:plugin)
    end
    main_menu.menu t(:localization) do |submenu|
      submenu.command t(:localize)
      submenu.command t(:localize_var)
    end
  end
end
