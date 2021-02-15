class Package < ApplicationRecord
  has_many :subscriptions

  before_validation :set_uuid, on: :create

  validates :package_type, presence: true, uniqueness: { case_sensitive: false , message: "Package type can't be assigned to more than one package."}
  validates :name, presence: true, uniqueness: { case_sensitive: false , message: "Package with the same name already exits!"}
  validates :amount, presence: true
  validates :discount , presence: true


  def set_uuid
    self.id = SecureRandom.uuid
  end
end
