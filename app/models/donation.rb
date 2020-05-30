class Donation < ApplicationRecord
  belongs_to :donor, class_name: 'User', optional: true
  belongs_to :giving_event
end
