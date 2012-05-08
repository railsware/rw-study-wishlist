# == Schema Information
#
# Table name: people
#
#  id                  :integer(4)      not null, primary key
#  name                :string(255)
#  birthday            :datetime
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer(4)
#  avatar_updated_at   :datetime
#  vk_id               :string(255)
#  email               :string(255)
#  privacy_type        :string(255)
#  is_user             :boolean(1)
#  role                :string(255)
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#
class WishesController < ApplicationController

  def index
    @title = "All your wishes"

    if  Person.all.size == 0
      current_user = Person.create(:name => "Zhenia", :vk_id => "id13829579", :email => "freeman1992@list.ru", :is_user => true, :role => "admin")
    else
      current_user = Person.find(1)
    end

    @wishes = Wish.where(:owner_id => current_user.id)
  end

  def show
    #Show a single wish
  end

  def new
    @title = "Add new wish"
    @wish = Wish.new
    result = params[:query]
    url_patern = /^((http|https|ftp):\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
    if result =~ url_patern
      @search_url = result
    else
      @search_name = result
    end

  end

  def edit
    #Show an edit wish form
  end

  def create
    @wish = Wish.new(params[:wish])
    if @wish.save
      redirect_to wishes_path
    else
      render new_wish_path
    end

    #Create a new wish
  end

  def update
    #Update a wish
  end

  def destroy

  end

  def search
    @title = "Search a wish"
  end




end
