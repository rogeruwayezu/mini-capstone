class User < ApplicationRecord
   has_secure_password
   has_many :orders
   validates :name, presence: true
   validates :email, uniqueness: true
   validates :password_digest, length: { in: 6..20 }
end
