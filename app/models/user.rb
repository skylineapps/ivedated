class User < ActiveRecord::Base
  has_secure_password
  has_many :image
  has_many :events
  has_many :joins
  has_many :joined_event, through: :joins, source: :event
  has_many :comments
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :city, :state, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150>", small: "75x75>" }, default_url: "/images/:style/missing.png",
                    :url => "/assets/images/profile/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/images/profile/:id/:style/:basename.:extension"

   # validates_attachment_presence :image
   validates_attachment_size :image, :less_than =>5.megabytes

   validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /JPG\Z/]

   validates_attachment_content_type :image, :content_type => /\Aimage/
end
