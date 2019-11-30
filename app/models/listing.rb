class Listing < ApplicationRecord
  belongs_to :property
  belongs_to :accepted_by, optional: true, class_name: "Company"

  scope :active, -> { where(accepted_by: nil) }

  delegate :full_address, to: :property
end
