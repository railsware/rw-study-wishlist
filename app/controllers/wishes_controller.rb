class WishesController < ApplicationController

  def index
    @wishes = Wish.order(:name)
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
		redirect_to @wish, notice: "hi"
	else
		render :new
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
