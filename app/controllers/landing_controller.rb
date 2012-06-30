class LandingController < ApplicationController
  def login
    @title = "Welcome"
	  auth_hash = request.env['omniauth.auth']
	  @app = VkontakteApi::Client.new(auth_hash.credentials.token)
	  friends_hashes = @app.friends.get(fields: 'uid, first_name, last_name, bdate, photo_medium_rec')
	  current_user_hash = @app.users.get(uids: auth_hash.uid, fields: 'photo_medium_rec').first
	  @person = Person.find_for_vkontakte_oauth auth_hash, friends_hashes, current_user_hash 

    if @person.persisted?
      session[:current_user_id] = @person.id
      token = auth_hash.credentials.token
      vk_id = auth_hash.uid
      flash[:notice] = "authentication success"
      Resque.enqueue(UpdateUser, @person.id, vk_id, token)
      render "login"
    else
      flash[:notice] = "authentication error"
      redirect_to root_path
    end
  end


  def home_page
    if (current_user)
      @title = "Welcome, dear #{current_user.name}";
    else
      @title = "Welcome, dear guest!"
    end
  end

  def local_login
    @title = "Local login"
    @local_user = Person.where(:is_user => true)
    Resque.enqueue(UpdateUser)
  end

  def local_login_as
    @title = "Local login"
    @person = Person.find(params[:id])
    if @person.persisted?
      session[:current_user_id] = @person.id
      flash[:notice] = "authentication success"
      redirect_to root_path
    else
      flash[:notice] = "authentication error"
      redirect_to root_path
    end
  end

  def logout
    @_current_user = session[:current_user_id] = nil
    redirect_to root_path
  end

end
