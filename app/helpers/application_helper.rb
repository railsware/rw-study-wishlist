module ApplicationHelper
  def is_active(param_controller, param_action)
    if ( current_page?(:controller => param_controller, :action => param_action) )
     "current_page_link"
    else
     "link1"
    end
  end

end
