class Admin::TagsController < Admin::BaseController

	def index
		load_tags
	end

  def edit
  	load_tag
  	build_tag
  end

  def update
  	load_tag
  	build_tag
  	if @tag.update(tag_params)
  		flash[:notice] = "#{@tag.name} updated."
      redirect_to admin_tags_path
    else
    	render 'edit'
  	end
  end

	private

	def load_tags
		@tags = ActsAsTaggableOn::Tag.all
	end

	def load_tag
		@tag ||= ActsAsTaggableOn::Tag.find(params[:id])
	end

	def build_tag
		@tag ||= ActsAsTaggableOn::Tag.build 
    @tag.attributes = tag_params
	end

	def tag_params
		tag_params = params[:acts_as_taggable_on_tag]
		tag_params ? tag_params.permit(
			:name) : {}
	end
end