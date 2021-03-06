class Admin::BaseController < ApplicationController
  before_filter :require_admin!

  layout 'admin'
  
  def index
    @last_signups = User.last_signups(10)
    @last_signins = User.last_signins(10)
    @count = User.users_count
    @post_count = Post.count
    @posts = Post.published.page(params[:page]).per(50)
    @published_post_count = Post.published.count
    @draft_post_count = Post.drafted.count
  end
end
