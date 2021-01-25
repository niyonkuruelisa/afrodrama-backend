class Package < ApplicationRecord
  has_many :subscriptions

  before_validation :set_uuid, on: :create

  validates :package_type, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :amount, presence: true
  validates :discount , presence: true


  def set_uuid
    self.id = SecureRandom.uuid
  end
end
