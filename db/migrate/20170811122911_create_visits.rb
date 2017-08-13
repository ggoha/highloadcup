class CreateVisits < ActiveRecord::Migration[5.1]
  def update_params(visit_params)
    visit_params['user_id'] = visit_params['user']
    visit_params['location_id'] = visit_params['location']
    visit_params.delete('user')
    visit_params.delete('location')
    visit_params
  end

  def change
    create_table :visits do |t|
    	t.integer :location_id
    	t.integer :user_id
    	t.datetime :visited_at
    	t.integer :mark
    end
	Dir['/Users/andrejryznikov/Downloads/data/visits*'].each do |file|
		JSON.parse(File.read(file))['visits'].each do |visit|
      binding.pry
			Visit.create(update_params(visit))
		end
	end
  end
end
