class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :prayer_id
end
