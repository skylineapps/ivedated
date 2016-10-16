class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :joins
  has_many :joined_event, through: :joins, source: :event
  has_many :comments
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :city, :state, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
