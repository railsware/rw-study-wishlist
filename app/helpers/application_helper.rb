# encoding: utf-8
module ApplicationHelper

  def top_menu_class(link_type, active_class = 'current_page_link', inactive_class = 'link1')
    c = params[:controller]
    a = params[:action]
    active = case link_type
               when :add_wish
                 c == 'wishes' && (a == 'search' || a == 'new')
               when :list_wishes
                 c == 'wishes' && (a == 'index' || a == 'edit')
               when :friends
                 c == 'friends'
               when :reserve
                 c == 'reserve' || (c == 'wishes' && a == 'show')
               else
                 false
             end

    active ? active_class : inactive_class

  end

  def friends_menu_class(link_type, active_class = 'current_friends_page', inactive_class = 'friendslink')
    if params[:action] == link_type
     active_class
    else
      inactive_class
    end
  end






end
