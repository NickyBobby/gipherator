require 'rails_helper'

RSpec.describe User, type: :model do
  context "user can have many gifs through" do
    it { should have_many(:favorites) }
    it { should have_many(:gifs).through(:favorites) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
  end
end
