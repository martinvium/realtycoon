class Street < ApplicationRecord
  belongs_to :city
  has_many :properties

  validates :name, uniqueness: true
end
