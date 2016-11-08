class Letter < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  validates :user_id, :description, :event_id, presence: true
end


