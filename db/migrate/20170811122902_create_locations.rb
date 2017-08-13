class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
    	t.text :place
    	t.string :country
    	t.string :city
    	t.integer :distance
    end
	Dir["/Users/andrejryznikov/Downloads/data/locations*"].each do |file|
		JSON.parse(File.read(file))["locations"].each do |location|
			Location.create(location)
		end
	end
  end
end
