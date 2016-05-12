class Post < ActiveRecord::Base
  paginates_per 3
  has_many :comments 
  belongs_to :user
end
