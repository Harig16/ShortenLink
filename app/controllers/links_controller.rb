class LinksController < ApplicationController

  def new
  end

  def create
    shortener = Shortener.new(link_params[:url])
    @link = shortener.generate_shorter_link
    if @link.persisted?
      respond_to :js
    else
      render :new, notice: "Can't create"
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end