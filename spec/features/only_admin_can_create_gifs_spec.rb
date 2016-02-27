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
end
