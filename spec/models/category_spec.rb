require 'rails_helper'

RSpec.describe Category, type: :model do
  context "it has many gifs" do
    it {should have_many(:gifs)}
  end  
end
