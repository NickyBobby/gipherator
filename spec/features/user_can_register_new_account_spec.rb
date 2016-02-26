require "rails_helper"

RSpec.feature "user can register a new account" do
  scenario "user sees user dashboard" do
    visit '/'
    click_on "Create Account"
    fill_in "Username", with: "Jones"
    fill_in "Password", with: "password"
    click_on "Register"

    expect(page).to have_content("Account Created!")
    expect(current_path).to eq '/'
  end
end
