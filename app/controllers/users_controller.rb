class UsersController < ApplicationController

  def listing
    if user_signed_in?
      user_type_id = current_user.user_type_id
      @requestors, @patients = User.users_listing(current_user, current_user.user_type_id)
    else
      render :welcome
    end
  end

  def create_request
    User.create_access_request(current_user.id, params[:patient_id],params[:document_id])
    listing
    render :listing
  end

  def approve_request
    User.approve_access_request(current_user.id, params[:requestor_id],params[:document_id])
    listing
    render :listing
  end

  def deny_request
    User.deny_access_request(current_user.id, params[:requestor_id],params[:document_id])
    listing
    render :listing
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
