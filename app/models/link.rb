class Link < ApplicationRecord
  validates_presence_of :url, :shorten_link
  validates :shorten_link, uniqueness: true, length: { is: 5 }
  validate :url_format

  def url_format 
    uri = URI.parse(url || "")
    errors.add(:url, "Invalid URL format") if uri.host.nil?
  end

  def short_url
    "http://localhost:3000/#{shorten_link}"
  end
end
