class SessionsController < ApplicationController
  before_action :redirect_if_authenticated, only: [:create, :new]
  before_action :authenticate_user!, only: [:destroy]

  def create
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user
      if @user.unconfirmed?
        redirect_to new_confirmation_path, alert: "incorrect email or password"
      elsif @user.authenticate(params[:user][:password])
        after_login_path = session[:user_return_to] || root_path
        login @user
        remember(@user) if params[:user][:remember_me] == "1"
        redirect_to after_login_path, notice: "signed in"
      else
        flash.now[:alert] = "incorrect email or password"
        render :new, status: :unprocessable_entity
      end
    else
      flash.now[:alert] = "incorrect email or password"
      render :new, status: :unprocessable_entity
    end

  end

  def destroy
    forget(current_user)
    logout
    redirect_to root_, notice: "signed out"
  end

  def new
  end
  
end
