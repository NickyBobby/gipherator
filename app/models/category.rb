class Category < ActiveRecord::Base
  has_many :gifs
  validates :name, presence: true
end
