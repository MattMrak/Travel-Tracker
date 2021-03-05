class Destination < ActiveRecord::Base

    belongs_to :user
    validates :location, presence: true
    validates :date_visited, presence: true

end