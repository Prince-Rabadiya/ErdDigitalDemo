class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates_presence_of :password
  validates :password, confirmation: { case_sensitive: true }
end
