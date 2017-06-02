class CommentsController  < ApplicationController

  before_action :build_comment

  respond_to :js, :json

  def new
  end

  def edit
  end

  def create
    if current_user_can_edit? && @comment.save
      respond_with @comment
    else
      respond_with @comment, status: 422
    end
  end

  alias_method :update, :create

  private

  def build_comment
    @comment ||= Comment.find_or_initialize_by(id: params[:id])
    @comment.attributes = comment_params
  end

  def comment_params
  	comment_params = params[:comment] || params
  	comment_params = comment_params.permit(
  		:title,
  		:comment,
  		:commentable_id,
  		:commentable_type,
      :commenter_type,
  		:commenter_id,
      :name,
      :email
  	) || {}
  end
end
