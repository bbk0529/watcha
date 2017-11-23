class Post < ApplicationRecord
	mount_uploader :photo, PtUploader
  	belongs_to :user
end
