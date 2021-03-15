class User < ActiveRecord::Base
    
    has_secure_password

    validates :password, presence: true
    validates :email, presence: true, uniqueness: true
    
    has_many :destinations
    has_many :comments
    
end