class Shortener

  attr_reader :url, :link_model 
  
  def initialize(url, link_model = Link)
    @url = url
    @link_model = link_model
  end
end