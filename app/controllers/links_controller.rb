class LinksController < ApplicationController

  def index
    @links = Link.all.order("created_at desc")
  end

  def create
    shortener = Shortener.new(link_params[:url])
    @link = shortener.generate_shorter_link
    if @link.persisted?
      respond_to :js
    else
      render "error.js.erb"
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end