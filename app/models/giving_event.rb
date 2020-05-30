class GivingEvent < ApplicationRecord
  belongs_to :organization
  has_many :donations

  validates :name, presence: true
  validates :target_amount, numericality: { only_integer: true, greater_than: 5 }
  validate :start_date_should_be_before_end_date

  def start_date_should_be_before_end_date
    if start_date.present? && end_date.present? && end_date < start_date
      errors.add(:start_date, "must be before the end date")
    end 
  end

end
