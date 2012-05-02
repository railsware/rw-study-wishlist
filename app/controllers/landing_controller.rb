class LandingController < ApplicationController
  def login
    @title = "Welcome"
    @person = Person.find_for_vkontakte_oauth request.env["omniauth.auth"]
    if @person.persisted?
      flash[:notice] = "authentication success"
    else
      flash[:notice] = "authentication error"
      redirect_to root_path
    end
  end



  def not_login
    @title = "Login Page"
  end
end
