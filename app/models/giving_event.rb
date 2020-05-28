class GivingEvent < ApplicationRecord
  belongs_to :organization
  has_many :donations
end
