require "rails_helper"

RSpec.feature "user can register a new account" do
  scenario "user sees user dashboard" do
    expect {
      visit root_path
      click_on "Create Account"
      fill_in "Username", with: "Jones"
      fill_in "Password", with: "password"
      click_on "Register"}.to change { User.count }

    expect(page).to have_content("Welcome, Jones")
    expect(page).to have_content("Account Created!")
    expect(current_path).to eq root_path

  end
end
