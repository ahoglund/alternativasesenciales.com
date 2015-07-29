class User::AvatarController < ApplicationController

  def new
  	build_user_avatar
  end

  def create
  	build_user_avatar
  	save_user_avatar or render 'new'
  end

  def edit
  	load_user_avatar
  	build_user_avatar
  end

  def update
  	load_user_avatar
  	build_user_avatar
  	@user_avatar.save or render 'edit'
  end

  private
  
  def build_user_avatar
  	@user_avatar ||= user_avatar_scope.build 
  	@user_avatar.attributes = user_avatar_params
  end

  def load_user_avatar
    @user_avatar ||= user_avatar_scope.find(params[:id])
  end

  def save_user_avatar
    if @user_avatar.save 
      redirect_to @user_avatar
    end
  end

  def user_avatar_params
    user_avater_params = params[:user_avatar]
    user_avatar_params ? user_avatar_params.permit(:avatar) : {}
  end

  def user_avatar_scope
    User::AsAvatar.where(nil)
  end
end