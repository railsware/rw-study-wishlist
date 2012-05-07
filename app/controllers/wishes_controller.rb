class WishesController < ApplicationController

  def index
    #List all wishes
  end

  def show
    #Show a single wish
  end

  def new
    @title = "Search for new wish"
    @wish = Wish.new
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


end
