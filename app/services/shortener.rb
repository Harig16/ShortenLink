require 'digest/sha2'
class Shortener

  attr_reader :url, :link_model 

  def initialize(url, link_model = Link)
    @url = url
    @link_model = link_model
  end

  def generate_shorter_link
    link_model.create(
      url: url,
      shorten_link: short_link
    )
  end

  def short_link 
    digest_link = get_digest 
    digest_link unless link_model.exists?(shorten_link: digest_link)
  end

  private

  def get_digest
    SecureRandom.uuid[0...5]
  end
end