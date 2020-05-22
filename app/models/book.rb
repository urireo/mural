class Book < ApplicationRecord
  belongs_to :visitor
  belongs_to :user
  belongs_to :segment
end
