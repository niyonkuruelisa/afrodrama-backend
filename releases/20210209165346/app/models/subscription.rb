class Subscription < ApplicationRecord
  belongs_to :package
  belongs_to :user

  before_validation :set_uuid, on: :create

  def set_uuid
    self.id = SecureRandom.uuid
  end
end
