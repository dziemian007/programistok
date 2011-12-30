require 'spec_helper'

describe "Stories", type: :request do
  before :each do
    21.times.each do |i|
      Timecop.travel(i.days.ago) do
        Story.create! title: "Story nr #{i}", teaser: "Teaser is here", content: "Content is here"
      end
    end
  end

  it "should list most recent stories on the first page" do
    visit root_path
    page.should have_content("Story nr 0")
    page.should have_content("Story nr 19")
    page.should have_content("Teaser is here")
    page.should_not have_content("Content is here")
  end

  it "should paginate to older stories with bottom page links" do
    visit root_path
    click_link "2"
    page.should have_content("Story nr 20")
    page.should_not have_content("Story nr 0")
    page.should_not have_content("Story nr 19")
  end

  it "should show full story page when clicking on it's title" do
    visit root_path
    click_link "Story nr 0"
    page.should have_content("Story nr 0")
    page.should have_content("Teaser is here")
    page.should have_content("Content is here")
  end
end
