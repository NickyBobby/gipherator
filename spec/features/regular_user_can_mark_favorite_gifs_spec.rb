require "rails_helper"

RSpec.feature "Regular user can mark favorite GIFs" do
  scenario "User sees all of their favorite GIFs" do
    user = User.create(username: "Nick", password: "password")
    gif_path = "http://gph.is/1W4DBfX"
    gif = Gif.create(name: "Kazoo Kid", image_path: gif_path)
    gif2 = Gif.create(name: "Nickrinna", image_path: gif_path)

    visit root_path
    click_on "Login"
    fill_in "Username", with: "Nick"
    fill_in "Password", with: "password"
    click_on "Login"
    expect(page).to have_no_content("Kazoo Kid")
    expect(page).to have_no_content("Nickrinna")

    visit root_path

    click_on "Add Kazoo Kid to Favorites"
    click_on "Add Nickrinna to Favorites"
    expect(current_path).to eq root_path
    click_on "View my Gifs"
    expect(current_path).to eq user_path(user)
    
    expect(page).to have_content "Kazoo Kid"
    expect(page).to have_content "Nickrinna"
  end

end
