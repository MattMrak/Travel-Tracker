class CreateDestinations < ActiveRecord::Migration[6.0]
  
    def change
      create_table :destinations do |t|
        t.string :location
        t.string :date_visited
        t.integer :user_id
      end
    end
  
  end