class Segment < ApplicationRecord
  has_many :users, through: :books
  has_many :visitors, through: :books
  has_many :books
  has_one_attached :image

end
