require 'spec_helper'

describe "Admins", type: :request do

  it "should link to admin login form" do
    visit root_path
		click_link "Admin"
    page.should have_content("Zaloguj")
  end

  it "failure should not sign admin in" do
		visit new_admin_session_path
		page.fill_in :email, :with => ""
		page.fill_in :password, :with => ""
		click_button "Zaloguj"
		page.should have_content("Niepoprawny")
  end
  
  it "success should sign admin in and out" do
    visit new_admin_session_path
    page.should have_content("Zaloguj")
  end

end
