class Property < ApplicationRecord
  self.inheritance_column = "zoink"

  belongs_to :street
  belongs_to :company, optional: true
  has_one :listing

  validates :number, uniqueness: {scope: :street}

  def full_address
    "#{street.name} #{number}, #{street.city.name}"
  end
end
