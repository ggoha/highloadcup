class User < ApplicationRecord
	has_many :locations, through: :visits
	has_many :visits

	
end
