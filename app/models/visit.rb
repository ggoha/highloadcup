class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :location

  scope :by_country, -> (country_name) { includes(:location).where(locations: { country: country_name }) }
  scope :to_distance, -> (distance) { includes(:location).where('locations.distance <  ?', distance) }
  scope :from_date, -> (fromDate) { where('visited_at > ? ', fromDate) }
  scope :to_date, -> (toDate) { where('visited_at < ? ', toDate) }   	
end
