class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :prayer_id, :created_at
  belongs_to :commenter
end
