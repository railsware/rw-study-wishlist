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

    current_user = Person.find_by_name("Zhenia")


    @wishes = Wish.where(:owner_id => current_user.id)
  end

  def show
    #Show a single wish
  end

  def new
    @title = "Add new wish"
    @wish = Wish.new
    @current_user = Person.find_by_name("Zhenia")
    result = params[:query]
    url_patern = /^((http|https|ftp):\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
    if result =~ url_patern
      @search_url = result
    else
      @search_name = result
    end

  end

  def edit
    @title = "Edit wish page"
    @wish = Wish.find(params[:id])
    @current_user = Person.find_by_name("Zhenia")
  end

  def create
    @wish = Wish.new(params[:wish])
    if @wish.save
      redirect_to wishes_path
    else
      redirect_to new_wish_path # Временно
    end

    #Create a new wish
  end

  def update
    @wish = Wish.find(params[:id])
    if @wish.update_attributes(params[:wish])
      redirect_to wishes_path
    else
      redirect_to edit_wish_path(@wish)
    end
  end

  def destroy
    @wish = Wish.find(params[:id])
    @wish.destroy
    redirect_to wishes_path
  end

  def search
    @title = "Search a wish"
  end




end
