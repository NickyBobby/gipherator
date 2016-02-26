require "rails_helper"

RSpec.feature "User can view their favorite GIFs" do
  scenario "User sees the page with their favorite GIFs" do
    user = User.create(username: "NickyBobby", password: "password", role: 0 )
    gif = Gif.create(name: "Kazoo Kid", image_path: "http://gph.is/1W4DBfX")
    user.gifs << gif
    visit user_path(user)
    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_content("Kazoo Kid")
  end
end
