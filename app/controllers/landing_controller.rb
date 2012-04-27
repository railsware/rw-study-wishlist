class LandingController < ApplicationController
  def login
    @title = "Welcome"
  end

  def not_login
    @title = "Login Page"
  end
end
