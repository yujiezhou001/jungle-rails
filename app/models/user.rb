class User < ActiveRecord::Base
    has_secure_password
    has_many :reviews
    validates :name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :password, presence:true, confirmation: true, length: { minimum: 6 }


    def self.authenticate_with_credentials(input1, input2)

        user = User.find_by_email(input1.downcase.strip)

        if user && user.authenticate(input2)
            return user
        else
            return nil
        end


    end   
end
