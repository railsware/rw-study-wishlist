module ApplicationHelper
  def is_active(param_controller, param_action)
    if (params[:controller] == param_controller && params[:action] == param_action)
    'current_page_link'
    else
      (params[:controller] == param_controller && ( params[:action] == 'new' && param_action == 'search' )) ? 'current_page_link' : 'link1'
    end
  end

end
