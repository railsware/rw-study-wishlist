class LandingController < ApplicationController
  def login
    @title = "Welcome"
	  auth_hash = request.env['omniauth.auth']
	  @app = VkontakteApi::Client.new(auth_hash.credentials.token)
	  friends_hashes = @app.friends.get(fields: 'uid, first_name, last_name, bdate, photo')
	  @person = Person.find_for_vkontakte_oauth auth_hash, friends_hashes

    if @person.persisted?
      session[:current_user_id] = @person.id
      flash[:notice] = "authentication success"
      redirect_to root_path
    else
      flash[:notice] = "authentication error"
      redirect_to root_path
    end
  end


  def home_page
    if (current_user)
      @title = "Welcome, dear #{current_user.name}";
    else
      @title = "Welcome, dear guest !!!!!!!!!!"
    end
  end

  def logout
    @_current_user = session[:current_user_id] = nil
    redirect_to root_path
  end

end
