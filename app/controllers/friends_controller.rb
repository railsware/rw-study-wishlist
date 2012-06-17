class FriendsController < ApplicationController
  before_filter :set_current_user

  protected

  def set_current_user
    if (current_user == nil)
      render 'landing/not_login'
    end
  end

  public

  def index
    @title ||= "All your VK friends"
    val = current_user.friendships
    @friends = val.collect { |v| v.friend }
  end
  
  def bdate_in_1_week
    @title = "Friends who have birthday in 1 week"
    d_now = DateTime.now
    friends = index
    @friends_1_week = friends.collect { |v| if v.birthday != nil then if (v.birthday.month == d_now.month)&&(v.birthday.day - d_now.day <= 7)&&(v.birthday.day - d_now.day >= 0) then v end end }
    @friends_1_week.delete(nil)
  end
  
  def bdate_in_2_weeks
    @title = "Friends who have birthday in 2 weeks"
    d_now = DateTime.now
    friends = index
    @friends_2_weeks = friends.collect { |v| if v.birthday != nil then if (v.birthday.month == d_now.month)&&(v.birthday.day - d_now.day <= 14)&&(v.birthday.day - d_now.day >= 0) then v end end }
    @friends_2_weeks.delete(nil)
  end
  
  def bdate_in_1_month
    @title = "Friends who have birthday in 1 month"
    d_now = DateTime.now
    friends = index
    @friends_1_month = friends.collect { |v| if v.birthday != nil then if ((v.birthday.month == d_now.month)&&(v.birthday.day - d_now.day >= 0))||((v.birthday.month == d_now.month + 1)&&(d_now.day - v.birthday.day >= 0)) then v end end }
    @friends_1_month.delete(nil)
  end
  
  def bdate_unknown
    @title = "Friends who have birthday and we don't know when"
    d_now = DateTime.now
    friends = index
    @friends_unknown = friends.collect { |v| if v.birthday == nil then v end }
    @friends_unknown.delete(nil)
  end
  
  def show
    #d_now = DateTime.now
    @friend = Person.find(params[:id])
    @title = "Page by #{@friend.name}"
    @wishes = Wish.where(:owner_id => params[:id])
    #@days_till_bday = Person.find(params[:id]).birthday - d.now
  end
  
end
