require 'rails_helper'

RSpec.describe User, type: :model do
  context "user can have many gifs through" do
    it { should have_many(:favorites) }
    it { should have_many(:gifs).through(:favorites) }
  end
end
