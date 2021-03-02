class Destination < ActiveRecord::Base
    
    validates :location, presence: true
    validates :date_visited, presence: true
    
    belongs_to :user

end