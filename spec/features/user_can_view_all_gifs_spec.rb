require "rails_helper"

RSpec.feature "Visitor can see all gifs" do
  scenario "Visitor sees all gifs on index page" do
    gif1 = Gif.create(name: "Kazoo Kid", image_path: "http://gph.is/1W4DBfX")
    gif2 = Gif.create(name: "Nickrinna", image_path: "http://giphy.com/gifs/nick-erinna-nickrinna-l4KigEkud4mFRIsGk")


    visit root_path
    expect(page).to have_content("The Gipherator")
    expect(page).to have_content("Kazoo Kid")
    expect(page).to have_content("Nickrinna")
  end
end
