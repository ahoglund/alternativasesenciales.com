class CommentsController  < ApplicationController
  
  before_action :authenticate_user!

  respond_to :js, :json

  def new
  	build_comment
  end

  def create
  	build_comment
    if @comment.save
      flash[:notice] = 'Comment was successfully posted.' 
      respond_with @comment
    else
      respond_with @comment, status: 422
    end
  end

  private

  def build_comment
    @comment ||= Comment.where(nil).build
    @comment.attributes = comment_params
  end

  def load_comment
    @comment ||= Comment.find(params[:id])
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