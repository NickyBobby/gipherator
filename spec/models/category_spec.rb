require 'rails_helper'

RSpec.describe Category, type: :model do
  context "it has many gifs" do
    it {should have_many(:gifs)}
    it {should validate_presence_of(:name)}
  end
end
