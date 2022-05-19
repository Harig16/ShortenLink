require 'rails_helper'

RSpec.describe Link, type: :model do
  it "should get valid for original URL for shorten_link" do 
    link = Link.new(
      url: "https://www.abcdef.com/xtz/dfr-erd",
      shorten_link: "12bde"
    )
    expect(link.valid?).to eq(true)
  end

  it "should get invalid for original URL is not formatted" do 
    link = Link.new(
      url: "abcdefk",
      shorten_link: "12bde"
    )
    expect(link.valid?).to eq(false)
  end

  it "should invalid if doesn't exist url" do 
    link = Link.new(
      shorten_link: "12bde"
    )

    expect(link.valid?).to eq(false)
  end

  it "should invalid if doesn't exist lookup code" do 
    link = Link.new(
      url: "https://www.abcdef.com/xtz/dfr-erd"
    )

    expect(link.valid?).to eq(false)
  end

  it "should invalid if lookup code is less than 7" do 
    link = Link.new(
      url: "https://www.abcdef.com/xtz/dfr-erd",
      shorten_link: "123456"
    )

    expect(link.valid?).to eq(false)
  end

  it "should get invalid shorten_link already exists" do 
    link = Link.new(
      url: "https://www.abcdef.com/xtz/dfr-erd",
      shorten_link: "12bde"
    )
    link.save

    link_2 = Link.new(
      url: "https://www.abcdef.com/xtz/sft-ofg",
      shorten_link: "12bde"
    )
    expect(link_2.valid?).to be(false)
  end
end
