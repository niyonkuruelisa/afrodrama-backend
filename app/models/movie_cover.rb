class MovieCover < ApplicationRecord

  before_validation :set_uuid, on: :create
  belongs_to :movie
  mount_uploader :cover, CoverUploader
  validates :originalName,presence: true
  validates :size,presence: true
  validates :coverType,presence: true

  # attribute accessors for temp use
  attr_accessor :url

  def set_uuid
    self.id = SecureRandom.uuid
  end
end
