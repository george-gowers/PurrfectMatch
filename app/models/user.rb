class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many_attached :photos
  has_one_attached :avatar
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
  pg_search_scope :search_by_gender_location_and_breed,
    against: [ :gender, :location, :breed ],
    using: {
      tsearch: { prefix: true }
    }

  acts_as_reader
end
