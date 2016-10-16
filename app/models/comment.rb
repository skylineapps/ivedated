class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  validates :user_id, :content, :event_id, presence: true, length: { in: 1..20000 }
end
