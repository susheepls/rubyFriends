class PasswordsController < ApplicationController
  before_action :redirect_if_authenticated

  def create
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user.present?
      if @user.confirmed?
        @user.send_password_reset_email!
        redirect_to root_path, notice: "If that user exists, we sent an email regarding password reset"
      else
        redirect_to new_confirmation_path, alert: "please confirm email first"
      end
    else
      redirect_to root_path, notice: "If that user exists, we sent an email regarding password reset"
    end
  
  end

  def edit
    @user = User.find_signed(params[:password_reset_token], purpose: :reset_password)
    if @user.present? && @user.unconfirmed?
      redirect_to new_confirmation_path, alert: "you must confirm email first"
    elsif @user.nil?
      redirect_to new_password_path, alert: "invalid or expired token"
    end
  end

  def new
  end

  def update
    @user = User.find_signed(params[:password_reset_token], purpose: :reset_password)
    if @user
      if @user.unconfirmed?
        redirect_to new_confirmation_path, alert: "you must confirm your email first"
      elsif @user.update(password_params)
        redirect_to login_path, notice: "sign in"
      else
        flash.now[:alert] = @user.errors.full_messages.to_sentence
        render :edit, status: :unprocessable_entity
      end
    else
      flash.now[:alert] = "invalid or expired token"
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end
