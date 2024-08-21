class ActiveSessionsController < ApplicationController
  before :authenticate_user!

  def destroy
    @active_session = current_user.active_session.find(params[:id])

    @active_session.destroy

    if current_user
      redirect_to account_path, notice: "session denied"
    else
      reset_session
      redirect_to root_path, notice: "signed out"
    end
  end
  
  def destroy_all
    current_user.active_sessions.destroy_all
    reset_session

    redirect_to root_path, notice: "signed out"
  end
  
end
