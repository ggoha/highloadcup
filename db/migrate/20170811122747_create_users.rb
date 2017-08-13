class CreateUsers < ActiveRecord::Migration[5.1]
  require 'json'
  def change
    create_table :users do |t|
    	t.string :email
    	t.string :first_name
    	t.string :last_name
    	t.boolean :gender
    	t.datetime :birth_date
    end
	Dir["/Users/andrejryznikov/Downloads/data/users*"].each do |file|
		JSON.parse(File.read(file))["users"].each do |user|
			User.create(user)
		end
	end
  end
end
