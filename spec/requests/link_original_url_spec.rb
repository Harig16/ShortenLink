require 'rails_helper'

RSpec.describe "Link original url", type: :request do

  it "should get original URL for given short link" do
    url = "https://www.abcdef.com/xtz/dfr-erd"
    shortener = Shortener.new(url)
    link = shortener.generate_shorter_link

    get link.short_url
    expect(response).to redirect_to(link.url)
  end
end