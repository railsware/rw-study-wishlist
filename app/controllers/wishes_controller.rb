class WishesController < ApplicationController

  def index
    #List all wishes
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

    #Create a new wish
  end

  def update
    #Update a wish
  end

  def destroy
    #Delete a wish
  end

  def search
    @title = "Search a wish"
  end




end
