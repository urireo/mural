class Visitor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :books
  has_many :segments, through: :books

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
end
