class City < ApplicationRecord
  has_many :streets

  validates :name, uniqueness: true
end
