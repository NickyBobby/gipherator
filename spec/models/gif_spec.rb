require 'rails_helper'

RSpec.describe Gif, type: :model do
  context "it belongs to a category" do
    it {should belong_to(:category)}
  end
end
