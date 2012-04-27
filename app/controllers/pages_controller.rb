class PagesController < ApplicationController
  def main
    @title = "Main"
  end

  def person
    @title = "Person"
  end
end
