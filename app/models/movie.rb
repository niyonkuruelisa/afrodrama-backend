class Movie < ApplicationRecord

  before_validation :set_uuid, on: :create
  validates :title,presence: true
  validates :titleEnglish,presence: true
  validates :movieType,presence: true
  validates :year,presence: true
  validates :summary,presence: true
  validates :description,presence: true

  # be careful with this,it will save you
  has_many :movie_genres
  has_many :genres, :through => :movie_genres

  has_many :movie_covers
  has_many :movie_files


  def set_uuid
    self.id = SecureRandom.uuid
  end
end
