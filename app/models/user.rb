class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable

  validates :username, presence: true

  has_many :prayers, :foreign_key => "author_id"

	has_many :user_groups
	has_many :groups, through: :user_groups

  has_many :lead_groups, :foreign_key => "leader_id", :class_name => "Group"
  
  has_many :comments
  has_many :commented_prayers, through: :comments, :source => :prayer
end
