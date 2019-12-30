class User < ApplicationRecord
    has_many :dogs
    has_many :posts
    has_secure_password
    validates :username, uniqueness: true
end
