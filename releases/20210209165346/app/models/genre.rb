class Genre < ApplicationRecord
  before_validation :set_uuid, on: :create

  validates :title,presence: true,uniqueness: {case_sensitive: false,message: 'Genre is already exists'}
  has_many :movie_genres
  has_many :movies, :through => :movie_genres

  def set_uuid
    self.id = SecureRandom.uuid
  end
end
