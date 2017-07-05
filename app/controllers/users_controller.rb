class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def show
    @user = User.find(params[:id])
    @created_events = @user.events
    @upcoming_events = @user.upcoming_events
    @previous_events = @user.previous_events
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome, #{@user.name}!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
