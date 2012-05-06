class ApplicationController < ActionController::Base
  #protect_from_forgery
  helper_method :current_user
  


  private



  def current_user
    @_current_user ||= session[:current_user_id] &&
      Person.find_by_id(session[:current_user_id])
  end

end
