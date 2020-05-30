class Organization < ApplicationRecord
  belongs_to :admin, class_name: 'User'
  has_many :giving_events

  validates :name, presence: true
  validates :address, presence: true
end
