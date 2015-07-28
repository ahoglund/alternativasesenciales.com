class CommentsController  < ApplicationController

  def new
  	build_comment
  end

  def create
  	build_comment
  	if @comment.save
  	  redirect_to :back
  	end
  end

  private

  def build_comment
    @comment = Comment.new(comment_params)
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