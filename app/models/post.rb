class Post < ActiveRecord::Base
  has_attached_file :pic, default_url: ""
  validates_attachment :pic, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  validates :post_title, :presence => true

  paginates_per 3
  has_many :comments
  belongs_to :user
  belongs_to :network
end
