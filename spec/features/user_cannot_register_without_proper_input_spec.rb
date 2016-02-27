require 'rails_helper'

RSpec.feature "User can not register account without proper information" do
  scenario "They see index page with error message" do
    visit root_path
    click_on "Create Account"
    fill_in "Username", with: "Jones"
    click_on "Register"

    expect(page).to have_content("Invalid input")

    visit root_path
    click_on "Create Account"
    fill_in "Password", with: "password"
    click_on "Register"

    expect(page).to have_content("Invalid input")
  end
end
