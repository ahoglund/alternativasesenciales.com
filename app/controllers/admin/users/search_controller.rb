class Admin::Users::SearchController < Admin::UsersController

  def index
    @users = Users::Search.new(params[:search], params[:page]).execute_query
  end

  private
end