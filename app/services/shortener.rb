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
      shorten_link: short_link,
      expired_date: expired_at
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

  def expired_at
    Time.now + 1.month 
  end
end