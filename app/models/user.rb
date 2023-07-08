class User < ApplicationRecord
    has_secure_password
  has_many :incomes
  has_many :bills
  has_many :personals
  has_one :savings
end
