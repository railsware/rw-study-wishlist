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
                 c == 'wishes' && a == 'reserve'
               else
                 false
             end

    active ? active_class : inactive_class

  end


end
