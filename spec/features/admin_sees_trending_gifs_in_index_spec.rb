require "rails_helper"

RSpec.feature "Admin can see trending gifs from giphy api" do
  scenario "Admin sees trending gifs on index view" do
    admin = User.create(username: "Nick", password: "password", role: 1 )
    visit root_path
    click_on "Login"
    fill_in "Username", with: "Nick"
    fill_in "Password", with: "password"
    click_on "Login"
    click_on "Add New Gifs"

    expect(page).to have_content "Trending right now!"
    # assert that page is displaying 25 images

  end
end
