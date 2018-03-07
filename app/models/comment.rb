class Comment < ApplicationRecord
  belongs_to :commenter, :class_name=> "User", :foreign_key => "user_id"
  belongs_to :commented_prayer, :class_name=> "Prayer", :foreign_key => "prayer_id"
end
