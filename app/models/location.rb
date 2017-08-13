class Location < ApplicationRecord
	has_many :users, through: :visits
	has_many :visits
end
