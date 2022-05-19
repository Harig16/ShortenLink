require 'rails_helper'

Rails.describe Shortener do 

  it "shortens given URL to 5 character short link" do
    url = "https://www.abcdef.com/xtz/dfr-erd"
    shortener = Shortener.new(url)
    expect(shortener.short_link.length).to eq(5)
  end

  it "gives each URL own short link" do
    url = "https://www.abcdef.com/xtz/dfr-erd"
    shortener = Shortener.new(url)
    code_1 = shortener.short_link

    url = "https://www.abcdef.com/xtz/sft-ofg"
    shortener = Shortener.new(url)
    code_2 = shortener.short_link
    expect(code_2).not_to eq(code_1)
  end

  #it "gives same URL equal length" do
  #  url = "https://www.abcdef.com/xtz/dfr-erd"
  #  shortener = Shortener.new(url)
  #  first_code = shortener.short_link
  #
  #  url = "https://www.abcdef.com/xtz/dfr-erd"
  #  shortener = Shortener.new(url)
  #  second_code = shortener.short_link
  #
  #  expect(second_code.length).to eq(first_code.length)
  #end

  it "generate Link record with unique short link" do
    url = "https://www.abcdef.com/xtz/dfr-erd"
    shortener = Shortener.new(url)
    link = shortener.generate_shorter_link
    expect(link.valid?).to be(true)

    link2 = shortener.generate_shorter_link
    expect(link2.valid?).to be(true)
  end
end