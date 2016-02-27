class Gif < ActiveRecord::Base
  belongs_to :category
  validates :name, presence: true
  validates :image_path, presence: true
end
