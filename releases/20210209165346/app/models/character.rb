class Character < ApplicationRecord

  before_validation :set_uuid, on: :create
  validates :names,presence: true

  def set_uuid
    self.id = SecureRandom.uuid
  end
end
