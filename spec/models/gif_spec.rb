require 'rails_helper'

RSpec.describe Gif, type: :model do
  context "it belongs to a category" do
    it {should belong_to(:category)}
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:image_path)}
  end
end
