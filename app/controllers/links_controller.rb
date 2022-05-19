class LinksController < ApplicationController

  def index
    @links = Link.all.order("created_at desc")
  end

  def display 
    link = find_link 
    if link.expired_date < Time.now
      link.destroy!
      redirect_to root_url, notice: "Link got expired"
    else
      if link.update(clicked: link.clicked + 1)
        redirect_to link.url 
      end
    end
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

  def find_link
    Link.find_by(shorten_link: params[:short_url])
  end
end