require "rails_helper"

RSpec.feature "only_admin_can_create_gifs" do
  scenario "admin sees new gif" do
    admin = User.create(username: "Nick", password: "password", role: 1)

    visit root_path
    click_on "Login"
    fill_in "Username", with: "Nick"
    fill_in "Password", with: "password"
    click_on "Login"
    click_on "Add New Gifs"
    expect(current_path).to eq admin_gifs_path

    expect {
      fill_in "Category", with: "anime"
      click_on "Create Gif"}.to change { Gif.count }
      visit root_path
    expect(page).to have_content "#{Gif.last.name}"
  end

  scenario "mere user sees error page" do
    user = User.create(username: "Jones", password: "password")
    visit root_path

    click_on "Login"
    fill_in "Username", with: "Jones"
    fill_in "Password", with: "password"
    click_on "Login"

    visit "/admin/gifs"
    expect(page).to have_content "The page you were looking for doesn't exist."
  end

  scenario "mere visitor sees error page" do
    visit root_path
    visit "/admin/gifs"
    expect(page).to have_content "The page you were looking for doesn't exist."
  end
end
