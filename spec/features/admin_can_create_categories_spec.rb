require "rails_helper"

RSpec.feature "Admin can create a categorie" do
  scenario "admin sees the category" do
    admin = User.create(username: "Jones", password: "password", role: 1)

    visit root_path

    click_on "Login"
    fill_in "Username", with: "Jones"
    fill_in "Password", with: "password"
    click_on "Login"

    expect(page).to have_content "Welcome Admin"
    click_on "Create Category"
    fill_in "Name", with: "Serial"
    click_on "Submit"
    expect(page).to have_content "Serial"
  end
end
