class User < ApplicationRecord
  has_many :donations, class_name: 'Donation', foreign_key: 'donor_id'
  has_many :organizations, class_name: 'Organization', foreign_key: 'admin_id'
end
