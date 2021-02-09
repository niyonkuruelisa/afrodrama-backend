class System < ApplicationRecord
  before_validation :set_uuid, on: :create

  validates :title, uniqueness: { case_sensitive: false }
  validates :about, uniqueness: { case_sensitive: false }
  validates :phone1, uniqueness: { case_sensitive: false }
  validates :keywords, uniqueness: { case_sensitive: false }
  validates :company_name, uniqueness: { case_sensitive: false }

  def set_uuid
    self.id = SecureRandom.uuid
  end
end
