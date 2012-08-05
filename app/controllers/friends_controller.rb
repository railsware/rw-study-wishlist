# encoding: utf-8
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
    @friends = current_user.friends
    @friends = @friends.sort_by { |hsh| [hsh[:is_user] ? 0:1]}
  end
  
  def bdate_in_1_week
    @title = "Friends who have birthday in 1 week"
    d_now = DateTime.now
    friends = current_user.friends
    @friends_1_week = friends.collect { |v| if v.birthday != nil then if (v.birthday.month == d_now.month)&&(v.birthday.day - d_now.day <= 7)&&(v.birthday.day - d_now.day >= 0) then v end end }
    @friends_1_week.delete(nil)
    @friends = @friends.sort_by { |hsh| [hsh[:is_user] ? 0:1]}  
  end
  
  def bdate_in_2_weeks
    @title = "Friends who have birthday in 2 weeks"
    d_now = DateTime.now
    friends = current_user.friends
    @friends_2_weeks = friends.collect { |v| if v.birthday != nil then if (v.birthday.month == d_now.month)&&(v.birthday.day - d_now.day <= 14)&&(v.birthday.day - d_now.day >= 0) then v end end }
    @friends_2_weeks.delete(nil)
    @friends_2_weeks = @friends_2_weeks.sort_by { |hsh| [hsh[:is_user] ? 0:1]}
  end
  
  def bdate_in_1_month
    @title = "Friends who have birthday in 1 month"
    d_now = DateTime.now
    friends = current_user.friends
    @friends_1_month = friends.collect { |v| if v.birthday != nil then if ((v.birthday.month == d_now.month)&&(v.birthday.day - d_now.day >= 0))||((v.birthday.month == d_now.month + 1)&&(d_now.day - v.birthday.day >= 0)) then v end end }
    @friends_1_month.delete(nil)
    @friends_1_month = @friends_1_month.sort_by { |hsh| [hsh[:is_user] ? 0:1]}
  end
  
  def bdate_unknown
    @title = "Friends who have birthday and we don't know when"
    d_now = DateTime.now
    friends = current_user.friends
    @friends_unknown = friends.collect { |v| if v.birthday == nil then v end }
    @friends_unknown.delete(nil)
    @friends_unknown = @friends_unknown.sort_by { |hsh| [hsh[:is_user] ? 0:1]}
  end
  
  def show
    @friend = Person.find(params[:id])
    @title = "Page by #{@friend.name}"
	@wishes = Wish.where(:owner_id => params[:id])
    @days_till_bday = days_till_bday(@friend)
    current_user.friendships.where(:friend_id => params[:id]).first.update_attribute(:wish_num, @wishes.size)
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
    
end
