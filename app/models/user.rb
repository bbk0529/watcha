class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	has_many :posts
	has_many :reviews
	devise :database_authenticatable, :registerable,
	         :recoverable, :rememberable, :trackable, :validatable
#role may be regarded as a member variable
	def admin?
		role=="admin"? true:false
	end
end
