class Link < ApplicationRecord
  validates_presence_of :url, :shorten_link
end
