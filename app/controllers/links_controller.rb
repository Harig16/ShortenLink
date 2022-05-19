class LinksController < ApplicationController

  def new
  end

  def create
    shortener = Shortener.new
  end
end