class LandingController < ApplicationController
  def login
    @title = "Welcome"
  end

  def not_login
    @title = "Login Page"
    if  Person.all.size == 0
      if(Person.create(:name => "Zhenia", :vk_id => "id13829579", :email => "freeman1992@list.ru", :is_user => true, :role => "admin"))
        flash[:success] = "User 'Zhenia' created successfully!"
      end
    end
  end
end
