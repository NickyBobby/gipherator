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

    click_on "Back to Home"

    click_on "Add Kazoo Kid to Favorites"
    click_on "Add Nickrinna to Favorites"
    expect(current_path).to eq root_path
    click_on "View my Gifs"
    expect(current_path).to eq user_path(user)

    expect(page).to have_content "Kazoo Kid"
    expect(page).to have_content "Nickrinna"
  end

  scenario "User can unfavorite a GIF" do
    user = User.create(username: "Nick", password: "password")
    gif_path = "http://gph.is/1W4DBfX"
    gif = Gif.create(name: "Kazoo Kid", image_path: gif_path)
    gif2 = Gif.create(name: "Nickrinna", image_path: gif_path)
    gif3 = Gif.create(name: "The Chad", image_path: gif_path)

    user.gifs << gif

    visit root_path
    click_on "Login"
    fill_in "Username", with: "Nick"
    fill_in "Password", with: "password"
    click_on "Login"
    expect(page).to have_content "Kazoo Kid"
    click_on "Back to Home"
    click_on "Add The Chad to Favorites"
    click_on "Add Nickrinna to Favorites"
    expect(3).to eq user.gifs.count
    click_on "View my Gifs"
    click_on "Remove Nickrinna from Favorites"
    click_on "Remove Kazoo Kid from Favorites"
    expect(1).to eq user.gifs.count
    expect(page).to have_content "The Chad"
    expect(page).not_to have_content "Nickrinna"
    expect(page).not_to have_content "Kazoo Kid"

    click_on "Back to Home"
    expect(page).to have_content "Nickrinna"
    expect(page).to have_content "Kazoo Kid"


  end

  scenario "User cannot favorite the same GIF twice" do
    user = User.create(username: "Nick", password: "password")
    gif2 = Gif.create(name: "Nickrinna", image_path: "gif_path")

    visit root_path
    click_on "Login"
    fill_in "Username", with: "Nick"
    fill_in "Password", with: "password"
    click_on "Login"

    click_on "Back to Home"

    click_on "Add Nickrinna to Favorites"
    expect(1).to eq user.gifs.count

    click_on "Add Nickrinna to Favorites"
    expect(page).to have_content "Nickrinna is already a favorite"
    expect(1).to eq user.gifs.count
  end

end
