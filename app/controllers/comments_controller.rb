class CommentsController  < ApplicationController
  
  before_action :authenticate_user!

  respond_to :js, :json

  def new
  	build_comment
  end

  def edit
    build_comment
  end

  def create
  	build_comment
    if current_user_can_edit? && @comment.save
      respond_with @comment
    else
      respond_with @comment, status: 422
    end
  end

  def update
    build_comment
    if current_user_can_edit? && @comment.save
      respond_with @comment
    else
      respond_with @comment, status: 422
    end   
  end

  private

  def build_comment
    @comment ||= Comment.find_or_initialize_by(id: params[:id])
    @comment.attributes = comment_params
  end

  def load_comment
    @comment ||= Comment.find(params[:id])
  end

  def current_user_can_edit?
    current_user == @comment.user
  end

  def comment_params
  	comment_params = params[:comment] || params
  	comment_params = comment_params.permit(
  		:title,
  		:comment,
  		:commentable_id,
  		:commentable_type,
  		:user_id
  	) || {}
  end
end