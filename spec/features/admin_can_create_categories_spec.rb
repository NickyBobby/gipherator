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
    expect(current_path).to eq new_admin_category_path    
    save_and_open_page
    fill_in "Name", with: "Serial"
    save_and_open_page
    click_on "Create Category"
    expect(page).to have_content "Serial"
  end
end
