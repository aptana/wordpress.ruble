require 'ruble'

bundle 'Wordpress' do |bundle|
  bundle.author = 'Joost de Valk, Brett Terpstra'
  bundle.description =  <<END
Wordpress Ruble converted from TextMate bundle. TM Bundle by:
http://yoast.com/tools/textmate/ - Joost de Valk
http://blog.circlesixdesign.com/ - Brett Terpstra
END

  bundle.repository = 'git://github.com/aptana/wordpress.ruble.git'

  bundle.menu 'Wordpress' do |main_menu|
    main_menu.menu 'Structure' do |submenu|
      submenu.command 'Sidebar'
      submenu.command 'Comments'
      submenu.command 'HTML Body tag'
      submenu.command 'Footer'
      submenu.command 'Header'
    end
    main_menu.menu 'Loop' do |submenu|
      submenu.command 'Comment:'
      submenu.command 'Author Meta'
      submenu.command 'Loop'
      submenu.command 'Headline'
      submenu.separator
      submenu.command 'Post:'
      submenu.command 'Navigation:'
      submenu.separator
      submenu.command 'Query Posts'
      submenu.command 'Flush Query Cache'
      submenu.command 'Insert Class Reference'
      submenu.command 'Insert Table Reference'
      submenu.command 'Insert Row Reference'
      submenu.separator
      submenu.command 'Insert Constant'
      submenu.command 'Insert Condition'
      submenu.separator
      submenu.command 'Bloginfo: General'
      submenu.command 'Bloginfo: Feeds'
      submenu.menu 'Navigation' do |submenu|
      end
    end
    main_menu.menu 'Categories' do |submenu|
      submenu.command 'List Categories (WP)'
      submenu.command 'List Categories (Full Options)'
      submenu.command 'Get Category Parents'
      submenu.command 'Get The Category (Categories)'
      submenu.command 'Cat->Member Variable'
    end
    main_menu.menu 'Plugins' do |submenu|
      submenu.command 'Filter'
      submenu.command 'Action'
    end
    main_menu.menu 'Other' do |submenu|
      submenu.command 'Escaping functions'
      submenu.command 'Single Post Title'
      submenu.command 'Post->Member Variable'
      submenu.command 'Comment->Member Variable'
      submenu.command 'Get Archives'
      submenu.command 'WP Redirect'
      submenu.command 'Link:'
    end
    main_menu.menu 'Plugin creation' do |submenu|
      submenu.command 'Widget'
      submenu.command 'Readme.txt'
      submenu.command 'Plugin with GPL'
      submenu.command 'Plugin'
    end
    main_menu.menu 'Localization' do |submenu|
      submenu.command 'Localize'
      submenu.command 'Localize var'
    end
  end
end
