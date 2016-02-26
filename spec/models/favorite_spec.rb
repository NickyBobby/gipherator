require 'rails_helper'

RSpec.describe Favorite, type: :model do
  context "can have many gifs"
  it { should belong_to(:gif) }
  it { should belong_to(:user) }
end
