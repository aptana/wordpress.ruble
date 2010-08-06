snippet 'Action' do |s|
  s.trigger = 'wpact'
  s.scope = 'text.html'
  s.expansion = 'add_action(\'${1:hook}\',\'${2:callback-function}\',${3:10},${4:1});'
end

snippet 'Filter' do |s|
  s.trigger = 'wpfilt'
  s.scope = 'text.html'
  s.expansion = 'add_filter(\'${1:hook}\',\'${2:callback-function}\',${3:10},${4:1});'
end

snippet 'Get Archives' do |s|
  s.trigger = 'wparch'
  s.scope = 'text.html'
  s.expansion = '<?php wp_get_archives(\'${1:type=monthly&limit=12&show_post_count=1}\'); ?>'
end

snippet 'Get Category Parents' do |s|
  s.trigger = 'catparents'
  s.scope = 'text.html'
  s.expansion = '<?php echo(get_category_parents(${1:category}, ${2:display link}, ${3:separator}, ${4:nice name})); ?>'
end

snippet 'Get The Category (Categories)' do |s|
  s.trigger = 'thecat'
  s.scope = 'text.html'
  s.expansion = '<?php 
foreach((get_the_category()) as $cat) { 
${1:echo $cat->cat_name . \' \';}$2 
} ?>
$0'
end

snippet 'Headline' do |s|
  s.trigger = 'headline'
  s.scope = 'text.html'
  s.expansion = '<a href="<?php the_permalink(); ?>" rel="bookmark">"\'><?php the_title(); ?></a>'
end

snippet 'HTML Body tag' do |s|
  s.trigger = 'body'
  s.scope = 'text.html'
  s.expansion = '<body ${1:<?php body_class(); ?>}>
	$2
</body>'
end

snippet 'List Categories (Full Options)' do |s|
  s.trigger = 'listcats'
  s.scope = 'text.html'
  s.expansion = '<?php list_cats(${1:optionall}, \'${2:all}\', \'${3:sort_column}\',\'${4:sort_order}\', \'${5:file}\', ${6:list}, ${7:optiondates}, ${8:optioncount}, ${9:hide_empty}, ${10:use_desc_for_title}, ${11:children}, ${12:child_of}, \'${13:Categories}\', ${14:recurse}, \'${15:feed}\', \'${16:feed_img}\', \'${17:exclude}\', ${18:hierarchical}); ?>$0'
end

snippet 'List Categories (WP)' do |s|
  s.trigger = 'listcats'
  s.scope = 'text.html'
  s.expansion = '<?php wp_list_cats(\'$1\'); ?>$0'
end

snippet 'Loop' do |s|
  s.trigger = 'loop'
  s.scope = 'text.html'
  s.expansion = '<?php if (have_posts()) : ?>

	<?php while (have_posts()) : the_post(); ?>

		<?php // Individual Post Styling ?>

	<?php endwhile; ?>

		<?php // Navigation ?>

	<?php else : ?>

		<?php // No Posts Found ?>

<?php endif; ?>'
end

snippet 'Plugin with GPL' do |s|
  s.trigger = 'plugin'
  s.scope = 'text.html'
  s.expansion = '<?php
/*
Plugin Name: $1
Version: ${2:0.1}
Plugin URI: ${TM_PLUGIN_BASE}$3
Description: $4
Author: ${TM_NAME}
Author URI: ${TM_HOMEPAGE}

Copyright `date +%Y` ${TM_NAME} (email: ${TM_EMAIL})

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

$5

?>
'
end

snippet 'Plugin' do |s|
  s.trigger = 'plugin'
  s.scope = 'text.html'
  s.expansion = '<?php
/*
Plugin Name: $1
Version: ${2:0.1}
Plugin URI: ${TM_PLUGIN_BASE}$3
Description: $4
Author: ${TM_NAME}
Author URI: ${TM_HOMEPAGE}
*/

$5


?>
'
end

snippet 'Query Posts' do |s|
  s.trigger = 'query'
  s.scope = 'text.html'
  s.expansion = '<?php query_posts("${1:cat=-3}") ?>'
end

snippet 'Readme.txt' do |s|
  s.trigger = 'readme'
  s.expansion = '=== ${1:Plugin Name} ===
Contributors: ${TM_WP_LOGIN}
Donate link: ${TM_HOMEPAGE}
Tags: ${2:tag, tag}
Requires at least: ${3:2.5}
Tested up to: ${4:2.8}
Stable tag: ${5:0.1}

${6:Short description}

== Description ==

${7:Short description}

== Installation ==

1. Upload the \`${8:plugin}\` folder to the \`/wp-content/plugins/\` directory
1. Activate the plugin through the \'Plugins\' menu in WordPress
1. $9

== Changelog ==

= $5 =
* Initial release.'
end

snippet 'Single Post Title' do |s|
  s.trigger = 'singletitle'
  s.scope = 'text.html'
  s.expansion = '<?php single_post_title(${1:\'Current post: \'}${2:, TRUE}); ?>'
end

snippet 'Widget' do |s|
  s.trigger = 'widget'
  s.scope = 'text.html'
  s.expansion = 'class $1_Widget extends WP_Widget {

	function $1_Widget() {
		\$widget_ops = array( \'classname\' => \'$2\', \'description\' => \'$3\' );
		\$control_ops = array( \'width\' => 200, \'height\' => 250, \'id_base\' => \'$4\' );
		\$this->WP_Widget( \'$4\', \'${5:title}\', \$widget_ops, \$control_ops );
	}

	function widget( \$args, \$instance ) {
		extract( \$args );
		echo \$before_widget;
		\$title = apply_filters(\'widget_title\', \$instance[\'title\'] );
		if ( \$title ) {
			echo \$before_title . \$title . \$after_title;
		}
		echo \$after_widget;
	}

	function update( \$new_instance, \$old_instance ) {
		\$instance = \$old_instance;
		foreach ( array(\'title\') as \$val ) {
			\$instance[\$val] = strip_tags( \$new_instance[\$val] );
		}
		return \$instance;
	}

	function form( \$instance ) {
		\$defaults = array( 
			\'title\' 		=> \'$5\', 
		);
		\$instance = wp_parse_args( (array) \$instance, \$defaults ); ?>
		<p>
			<label for="<?php echo \$this->get_field_id( \'title\' ); ?>"><?php _e("Title"); ?>:</label>
			<input id="<?php echo \$this->get_field_id( \'title\' ); ?>" name="<?php echo \$this->get_field_name( \'title\' ); ?>" value="<?php echo \$instance[\'title\']; ?>" style="width:100%;" />
		</p>
	<?php 
	}
}

function $4_widget_func() {
	register_widget( \'$1_Widget\' );
}

add_action( \'widgets_init\', \'$4_widget_func\' );
'
end

snippet 'WP Redirect' do |s|
  s.trigger = 'wpredir'
  s.scope = 'text.html'
  s.expansion = 'wp_redirect("$1",${2:301});	'
end

