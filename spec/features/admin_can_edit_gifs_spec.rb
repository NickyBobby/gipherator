require "rails_helper"

RSpec.feature "admin can edit gif" do
  scenario "admin sees index with updated gif" do
    admin = User.create(username: "Jones", password: "password", role: 1)
    gif = Gif.create(name: "Kitty Cat", image_path: "http://media0.giphy.com/media/QgcQLZa6glP2w/200.gif")

    visit root_path

    click_on "Login"
    fill_in "Username", with: "Jones"
    fill_in "Password", with: "password"
    click_on "Login"

    click_on "Back to Home"
    expect(page).to have_content "Kitty Cat"

    click_on "Edit Kitty Cat"
    expect(current_path).to eq edit_admin_gif_path(gif)
    fill_in "Name", with: "Big Cat, Little Cat"
    fill_in "Image path", with: "http://media0.giphy.com/media/QgcQLZa6glP2w/200.gif"
    click_on "Update Gif"
    expect(current_path).to eq root_path

    expect(page).to have_content "Big Cat, Little Cat"
    expect(page).to have_content "GIF was updated successfully!!"
    expect(page).not_to have_content "Kitty Cat"
  end

  scenario "admin error message" do
    admin = User.create(username: "Jones", password: "password", role: 1)
    gif = Gif.create(name: "Kitty Cat", image_path: "http://media0.giphy.com/media/QgcQLZa6glP2w/200.gif")

    visit root_path
    click_on "Login"
    fill_in "Username", with: "Jones"
    fill_in "Password", with: "password"
    click_on "Login"

    click_on "Back to Home"
    expect(page).to have_content "Kitty Cat"

    click_on "Edit Kitty Cat"
    expect(current_path).to eq edit_admin_gif_path(gif)
    fill_in "Name", with: ""
    click_on "Update Gif"
    expect(current_path).to eq admin_gif_path(gif)

    expect(page).to have_content "Invalid input"

  end
end
