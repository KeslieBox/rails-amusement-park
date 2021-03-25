class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    validates_presence_of :name
    has_secure_password
    
    def mood
        if !admin 
            happiness > nausea ? "happy" : "sad"
        end
    end
end
