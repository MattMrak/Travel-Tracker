class CreateComments < ActiveRecord::Migration[6.0]
    
    def change
      create_table :comments do |t|
        t.references :user, foreign_key: {on_delete: :cascade}
        t.references :destination, foreign_key: {on_delete: :cascade}
        t.text :body
      end
    end
  
  end
    