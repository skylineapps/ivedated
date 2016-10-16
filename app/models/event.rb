class Event < ActiveRecord::Base
  belongs_to :user
  has_many :joins
  has_many :users, through: :joins, source: :user
  has_many :comments
  validates :user_id, :name, :date, :city, :state, presence: true, length: { in: 1..200 }
end
