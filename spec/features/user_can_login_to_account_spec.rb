require 'rails_helper'

RSpec.feature "user can login to and logout of account" do
  scenario "user sees their dashboard" do
    user = User.create(username: "Jones", password: "password")
    gif1 = Gif.create(name: "Kazoo Kid", image_path: "http://gph.is/1W4DBfX")
    gif2 = Gif.create(name: "Nickrinna", image_path: "http://giphy.com/gifs/nick-erinna-nickrinna-l4KigEkud4mFRIsGk")

    user.gifs << gif1

    visit root_path
    expect(page).to have_content "Kazoo Kid"
    expect(page).to have_content "Nickrinna"
    expect(page).to have_no_content "Welcome, Jones"

    click_on "Login"
    fill_in "Username", with: "Jones"
    fill_in "Password", with: "password"
    click_on "Login"

    expect(current_path).to eq user_path(user)
    expect(page).to have_content "Welcome, Jones"
    expect(page).to have_content "Kazoo Kid"
    expect(page).to have_no_content "Nickrinna"
    expect(page).to have_content "Logout"

    click_on "Logout"
    expect(current_path).to eq root_path
    expect(page).to have_no_content "Welcome, Jones"
  end
end
