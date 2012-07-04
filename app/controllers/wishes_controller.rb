# encoding: utf-8

class WishesController < ApplicationController
  before_filter :set_current_user

  protected
  def set_current_user
    if (current_user == nil)
      render 'landing/not_login'
    end
  end


  public

  def index
    @title = "All your wishes"
    @wishes = Wish.where(:owner_id => current_user.id)
  end

  def show
    #Show a single wish
    @wish = Wish.find(params[:id])
    @friend = Person.find(@wish.owner_id)
    @days_till_bday = days_till_bday(@friend)
    @title = "#{@wish.name}"
  end

  def days_till_bday(friend)
    if friend.birthday == nil then return end
    d_now = DateTime.strptime(DateTime.now.to_s[5,DateTime.now.to_s.length],'%m-%d')
    bday = DateTime.strptime(friend.birthday.to_s[5, friend.birthday.to_s.length],'%m-%d')
    if (d_now == bday)
      'сегодня'
    else
      if (bday > d_now)
        count = (bday - d_now).to_int
        '( через ' + count.to_s + ' '+ Russian.p(count,'день','дня','дней','дня') + ' )'
      else
        count = 365 - (d_now - bday).to_int
        '( через ' + count.to_s + ' '+ Russian.p(count,'день','дня','дней','дня') + ' )'
      end
    end
  end

  def new
    @title = "Add new wish"
    @wish = Wish.new
    result = params[:query]
    url_patern = /^((http|https|ftp):\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
    if result =~ url_patern
      @search_url = result
      @search_name = ""
    else
      @search_name = result
      @search_url = ""
    end

  end

  def edit
    @title = "Edit wish page"
    @wish = Wish.find(params[:id])
  end

  def create
    @wish = Wish.new(params[:wish])
    if @wish.save
      flash[:success] = "Your wish was saved successfully"
      redirect_to wishes_path
    else
      flash[:error] = "Error in wish saving"
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
    flash[:success] = "Your wish was delete successfully"
    redirect_to wishes_path
  end

  def search
    @title = "Search a wish"
  end


end
