class Donation < ApplicationRecord
  belongs_to :donor, class_name: 'User', optional: true
  belongs_to :giving_event

  validates :amount, numericality: { only_integer: true, greater_than: 5 }
end
