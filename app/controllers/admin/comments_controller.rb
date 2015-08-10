class Admin::CommentsController < Admin::BaseController
	def index
		@comments = Comment.all
	end

	def show
    load_comment
    build_comment
	end

	def update
    save_comment
	end

  private

  def load_comment
    @comment ||= Comment.find(params[:id])
  end

  def build_comment
    @comment ||= Comment.where(nil).build
    @comment.attributes = comment_params
  end

  def save_comment
  	if @comment.save 
      redirect_to admin_commments_path
  	end
  end

  def comment_params
  	comment_params = params[:comment] || params
  	comment_params = comment_params.permit(
  		:title,
  		:comment,
  		:commentable_id,
  		:commentable_type,
  		:user_id,
  		:approved
  	) || {}
  end
end	