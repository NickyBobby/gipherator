require "rails_helper"

RSpec.feature "Admin can delete gif" do
  scenario "Admin no longer sees deleted gif" do
    admin = User.create(username: "Jones", password: "password", role: 1)
    gif = Gif.create(name: "Kitty Cat", image_path: "http://media0.giphy.com/media/QgcQLZa6glP2w/200.gif")

    visit root_path

    click_on "Login"
    fill_in "Username", with: "Jones"
    fill_in "Password", with: "password"
    click_on "Login"

    click_on "Back to Home"
    expect(page).to have_content "Kitty Cat"

    click_on "Delete Kitty Cat"
    expect(current_path).to eq root_path
    
    expect(page).to have_content "GIF was successfully deleted"
    expect(page).not_to have_content "Kitty Cat"
  end
end
