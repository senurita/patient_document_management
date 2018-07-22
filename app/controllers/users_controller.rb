class UsersController < ApplicationController

  def listing
    if user_signed_in?
      role = UserType.where(:id => current_user.user_type_id).first.name
      if role == "Doctor" || role == "Pharmacist"
        @patients = User.where('user_type_id = (?)',2)
      elsif role == "Patient"
        @requestors = RequestAccess.where(grantor_id: current_user.id, :status => "pending")
      end
    else
      render :welcome
    end
  end

  def create_request
    request_access = RequestAccess.create(requestor_id: params[:user_id], grantor_id: params[:patient_id], document_id: params[:document_id])
    listing
    render :listing
  end

  def approve_request
    request_access = RequestAccess.where(grantor_id: params[:user_id], requestor_id: params[:requestor_id], document_id: params[:document_id]).first
    request_access.status = "approved"
    request_access.save!
    listing
    render :listing
  end

  def deny_request
    request_access = RequestAccess.where(grantor_id: params[:user_id], requestor_id: params[:requestor_id], document_id: params[:document_id]).first
    request_access.status = "denied"
    request_access.save!
    listing
    render :listing
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
