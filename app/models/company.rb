class Company < ApplicationRecord
  has_many :properties

  validates :name, uniqueness: true
  validates :cash, numericality: {greater_than: 0}
end
