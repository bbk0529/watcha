class Movie < ApplicationRecord
	  mount_uploader :photo_url, PhotoUploader
	  belongs_to :user
	  has_many :reviews
end
