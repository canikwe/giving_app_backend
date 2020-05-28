class Donation < ApplicationRecord
  belongs_to :donor, class_name: 'User'
  belongs_to :giving_event
end
