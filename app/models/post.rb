class Post < ActiveRecord::Base

    attr_accessor :name, :year_visited
    
    belongs_to :user

end