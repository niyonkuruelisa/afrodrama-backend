class MovieFile < ApplicationRecord

  before_validation :set_uuid, on: :create
  belongs_to :movie
  mount_uploader :movie, MovieUploader
  validates :original_name,presence: true
  validates :size,presence: true
  # attribute accessors for temp use
  attr_accessor :streamURL


  def set_uuid
    self.id = SecureRandom.uuid
  end
end