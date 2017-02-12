class User < ApplicationRecord
   has_secure_password
   has_many :orders
   validates :name, presence: true
   validates :email, presence: true
   validates :password_digest, length: { in: 5..20 }
end
