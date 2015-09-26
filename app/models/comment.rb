class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  acts_as_commentable

  belongs_to :commentable, :polymorphic => true
  
  validates_presence_of :title, :comment

  default_scope -> { order('created_at ASC') }

  belongs_to :user

  def top_level_commentable(c: nil)
    c.is_a?(Comment) ? top_level_commentable(c: c.commentable) : commentable
  end
end
