class Admin::UsersController < Admin::BaseController

  def index
    load_users
  end

  def show
    redirect_to edit_admin_user_path(params[:id])
  end

  def edit
    load_user 
    build_user
  end

  def update
    load_user 
    build_user

    if @user.valid?
      @user.skip_reconfirmation!
      @user.save
      redirect_to admin_users_path, notice: "#{@user.email} updated."
    else
      flash[:alert] = "#{old_email} couldn't be updated."
      render :edit
    end
  end


  private

  def load_users 
    @users = User.paged(params[:page])
  end

  def load_user
    @user ||= User.find(params[:id])
  end

  def build_user
    @user ||= User.build 
    @user.attributes = user_params
  end

  def user_params
    user_params = params[:user]
    user_params ? params.permit(
    :email,
    :password,
    :password_confirmation,
    :admin,
    :locked
    ) : {}
  end

end
