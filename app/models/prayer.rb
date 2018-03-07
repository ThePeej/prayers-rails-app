class Prayer < ApplicationRecord
  validates :overview, presence: true
	
	has_many :group_prayers
  has_many :groups, through: :group_prayers
  
  has_many :comments
  has_many :commenters, through: :comments, :source => :user

  belongs_to :author, :class_name => "User"
end
