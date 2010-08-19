# This file contains manually converted templates (intended for Eclipse and Aptana Studio 1.2)
# Originals can be found at: http://www.ilovecolors.com.ar/wordpress-code-templates-for-aptana/
require 'ruble'

with_defaults :scope => 'source.php' do

#WP: inserts code to load file on WordPress options page
snippet '_openfile' do |s|
  s.trigger = '_openfile'
  s.expansion = "<textarea name=\"${1:option_name}\" cols=\"60\" rows=\"10\"><?php
if( is_file($$${2:filename}) && filesize($$${2:filename}) > 0) {
  $$fo = "";
  $$fo = fopen($$${2:filename}, 'r');
  $$fr = fread($$fo, filesize($$${2:filename}));
  echo $$fr;
  fclose($$fo);
}
else _e('The file you\'re looking for can\'t be found.');?>  </textarea>"
end
  
#WP: add code to save a textarea content to a file in a WP options page
snippet '_savefile' do |s|
  s.trigger = '_savefile'
  s.expansion = "/*Save file*/
if(!empty($$_POST['Submit'])){
  $$${1:new_content} = stripslashes($$_POST['${2:textarea_option_name}']);
  if(is_writeable($$${3:filename})) {
      $$fow = fopen($$${3:filename}, 'w+');
      fwrite($$fow, $$${1:new_content});
    fclose($$fow);
      echo '<div id=\"message\" class=\"updated fade\"><p><strong>'. _e('File saved.') .'</strong></p></div>'.\"\n\";
  }
  else {
    echo '<div id=\"message\" class=\"updated fade\"><p><strong>'. _e('There has been an error trying to write the file. Are you sure you have permission to do so?') .'</strong></p></div>'.\"\n\";
  }
}"
end

#WP: add_action generic function
snippet 'add_action' do |s|
  s.trigger = 'add_action'
  s.expansion = "add_action('${1:hook_name}', '${2:function_name}_${1:hook_name}');"
end

#WP: add_action to init hook
snippet 'add_action_init' do |s|
  s.trigger = 'add_action_init'
  s.expansion = "add_action('init', '${1:function_name}_init');"
end

#WP: add_action with wphead hook
snippet 'add_action_wphead' do |s|
  s.trigger = 'add_action_wphead'
  s.expansion = "add_action('wp_head', '${0}_wp_head');"
end

#WP: add_filter generic function
snippet 'add_filter' do |s|
  s.trigger = 'add_filter'
  s.expansion = "add_filter('${1:hook_name}', '${2:function_name}_${1:hook_name}');"
end

#WP: add_action with the_content hook
snippet 'add_filter_the_content' do |s|
  s.trigger = 'add_filter_the_content'
  s.expansion = "add_filter('the_content', '${1:hook_name}');"
end

#WP: add_option function
snippet 'add_option' do |s|
  s.trigger = 'add_option'
  s.expansion = "add_option('${1:option_name}', '${2:option_value}');"
end

#WP: add an option page to Settings menu
snippet 'add_options_page' do |s|
  s.trigger = 'add_options_page'
  s.expansion = "add_options_page('${1:Plugin_or_theme_name} Options', '${1:Plugin_or_theme_name} Options', 8, __FILE__, '${2:function_name}_options');"
end

#WP: get_bloginfo generic empty tag
snippet 'get_bloginfo' do |s|
  s.trigger = 'get_bloginfo'
  s.expansion = "get_bloginfo('$0')"
end

#WP: get_bloginfo with 'url' tag
snippet 'get_bloginfo_url' do |s|
  s.trigger = 'get_bloginfo_url'
  s.expansion = "get_bloginfo('url')"
end

#WP: get theme footer
snippet 'get_footer' do |s|
  s.trigger = 'get_footer'
  s.expansion = "<?php get_footer(); ?>"
end

#WP: get the WordPress header
snippet 'get_header' do |s|
  s.trigger = 'get_header'
  s.expansion = "<?php get_header(); ?>"
end

#WP: get_option function
snippet 'get_option' do |s|
  s.trigger = 'get_option'
  s.expansion = "get_option('$0')"
end

#WP: gets meta from post
snippet 'get_post_meta' do |s|
  s.trigger = 'get_post_meta'
  s.expansion = "get_post_meta($$post->ID, '$0', $$single = true);"
end

#WP: get WP sidebar
snippet 'get_sidebar' do |s|
  s.trigger = 'get_sidebar'
  s.expansion = "<?php get_sidebar($0); ?>"
end

#WP: include generic template
snippet 'include_template' do |s|
  s.trigger = 'include_template'
  s.expansion = "<?php include (TEMPLATEPATH . '/${1:template_name}.php'); ?>"
end

#WP: inserts sample the_loop (as seen on Justin Tadlock's blog)
snippet 'the_loop' do |s|
  s.trigger = 'the_loop'
  s.expansion = "<?php if(have_posts()) : while(have_posts()) : the_post(); ?>

  <div id=\"post-<?php the_ID(); ?>\" <?php post_class(); ?>>

    <?php the_title('<h2 class=\"entry-title\"><a href=\"' . get_permalink() . '\" title=\"' . the_title_attribute('echo=0') . '\" rel=\"bookmark\">', '</a></h2>'); ?>

    <p class=\"byline\">
      <span class=\"author vcard\"><?php the_author_posts_link(); ?></span> <span class=\"sep\">|</span> 
      <abbr class=\"published\" title=\"<?php the_time(__('l, F jS, Y, g:i a', 'example')); ?>\"><?php the_time(__('F j, Y', 'example')); ?></abbr>
      <?php edit_post_link(__('Edit', 'example'), ' <span class=\"sep\">|</span> <span class=\"edit\">', '</span> '); ?>
    </p>

    <div class=\"entry-content\">
      <?php the_content(__('Continue reading', 'example')); ?>
      <?php wp_link_pages('before=<p class=\"pages\">' . __('Pages:','example') . '&after=</p>'); ?>
    </div>

    <p class=\"entry-meta\">
      <span class=\"categories\"><?php _e('Posted in', 'example'); ?> <?php the_category(', '); ?></span>
      <?php the_tags('<span class=\"tags\"> <span class=\"sep\">|</span> ' . __('Tagged', 'example') . ' ', ', ', '</span>'); ?> 
      <span class=\"sep\">|</span> <?php comments_popup_link(__('Leave a response', 'example'), __('1 Response', 'example'), __('% Responses', 'example'), 'comments-link', __('Comments closed', 'example')); ?> 
    </p>

  </div>

  <?php endwhile; ?>

<?php else : ?>

  <p class=\"no-posts\"><?php _e('Sorry, no posts matched your criteria', 'example'); ?></p>

<?php endif; ?> "
end

#WP: wp_enqueue_script for known script only
snippet 'wp_enqueue_script' do |s|
  s.trigger = 'wp_enqueue_script'
  s.expansion = "wp_enqueue_script('$0');"
end

#WP: safely enqueues jQuery script included with WordPress
snippet 'wp_enqueue_script_jquery' do |s|
  s.trigger = 'wp_enqueue_script_jquery'
  s.expansion = "wp_enqueue_script('jquery');"
end

#WP: for unknown script with jquery dependency.
snippet 'wp_enqueue_script_unknown_jquery' do |s|
  s.trigger = 'wp_enqueue_script_unknown_jquery'
  s.expansion = "wp_enqueue_script('${1:handler}',  $$${2:path} . '${1:handler}.js', array('jquery'));"
end

#WP: wp_enqueue_style for unknown style
snippet 'wp_enqueue_style' do |s|
  s.trigger = 'wp_enqueue_style'
  s.expansion = "wp_enqueue_style('${1:handler}', $$${2:path} . '${1:handler}.css', false, false, 'screen');"
end

#WP: inserts code for a new WP_Query object
snippet 'wpquery' do |s|
  s.trigger = 'wpquery'
  s.expansion = "$$${1:wpquery_obj} = new WP_Query('category_name=${2:category_name}&showposts=${3:1}&orderby=${4:post_date}&order=${5:desc}');
$$${1:wpquery_obj}->the_post();"
end

end