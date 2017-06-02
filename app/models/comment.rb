class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  acts_as_commentable

  belongs_to :commentable, :polymorphic => true

  validates_presence_of :title, :comment

  default_scope -> { order('created_at ASC') }

  scope :approved, -> { where(approved: true) }

  scope :unapproved, -> { where(approved: false) }

  scope :recent, ->(n) { order(created_at: :desc).limit(n) }

  belongs_to :user

  def top_level_commentable
    commentable.is_a?(Comment) ? commentable.top_level_commentable : commentable
  end
end
