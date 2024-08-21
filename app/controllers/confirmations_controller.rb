class ConfirmationsController < ApplicationController

  before_action :redirect_if_authenticated, only: [:create, :new]

  def create
    @user = User.find_by(email: params[:user][:email].downcase)

    if @user.present? && @user.unconfirmed?
      @user.send_confirmation_email!
      redirect_to root_path, notice: "Check your email for confirmation instructions."
    else
      redirect_to new_confirmation_path, alert: "We could not find a user with that email or that email has already been confirmed."
    end
  end

  def edit
    token = params[:id] 
    
    @user = User.find_signed(token, purpose: :confirm_email)
  
    if @user.present? && @user.unconfirmed_or_reconfirming?
      if @user.confirm!
        login @user
        redirect_to root_path, notice: "Your account has been confirmed."
      else
        redirect_to new_confirmation_path, alert: "Unable to confirm your account. Please try again."
      end
    else
      redirect_to new_confirmation_path, alert: "Invalid or expired confirmation token. Please request a new confirmation email."
    end
  end
  

  def new
    @user = User.new
  end

end