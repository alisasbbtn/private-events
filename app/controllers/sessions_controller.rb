class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    if user
      log_in user
      flash[:success] = "Welcome back, #{user.name}!"
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
