class User < ApplicationRecord
    has_secure_password
    has_many :dogs
    has_many :posts
    validates :username, uniqueness: true
end
