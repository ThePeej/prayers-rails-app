class Group < ApplicationRecord
  validates :name, presence: true
  validates :leader, presence: true
  
  has_many :user_groups
	has_many :members, through: :user_groups, :source => :group_member

	has_many :group_prayers
	has_many :prayers, through: :group_prayers

	belongs_to :leader, :class_name => "User"

	def self.all_public
    self.all.find_all{|group| group.is_public}.sort.reverse #collects and displays only public groups
  end
end
