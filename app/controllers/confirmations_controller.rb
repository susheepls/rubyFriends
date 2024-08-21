class ConfirmationsController < ApplicationController
  
  before_action :redirect_if_authenticated, only: [:create, :new]

  def create
    @user = User.find_by(email: params[:user][:email].downcase)

    if @user.present? && @user.unconfirmed?
      @user.send_confirmation_email!
      redirect_to root_path, notice: "check your email again for confirmation"
    else
      redirect_to new_confirmation_path, alert: "we could not find a user with that email or it has already been confirmed"
    end
  end

  def edit 
    @user = User.find_signed(params[:confirmation_token], purpose: :confirm_email)

    if @user.present?
      @user.confirm!
      login @user
      redirect_to root_, notice: "your account has been confirmed"
    else
      redirect_to new_confirmation_path, alert: "invalid token"
    end 
  end

  def new
    @user = User.new
  end

end
