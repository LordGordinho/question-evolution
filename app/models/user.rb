class User < ApplicationRecord
  has_secure_password

  belogns_to :role
  has_many :answers
end
