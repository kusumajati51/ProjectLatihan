class User < ApplicationRecord
    has_secure_password
    has_many :todo
    validates_uniqueness_of :email
    validates_presence_of :password
    validates_presence_of :password_confirmation
end
