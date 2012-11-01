class Task < ActiveRecord::Base
	belongs_to :user
  attr_accessible :content, :limit, :title
  validates :title, :presence => true
end
