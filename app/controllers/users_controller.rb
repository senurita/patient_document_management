class UsersController < ApplicationController

  def listing
    if user_signed_in?
      user_type_id = current_user.user_type_id
      if user_type_id == USER_MAPPING[1][:id] || user_type_id == USER_MAPPING[3][:id]
        @patients = User.where('user_type_id = (?)',USER_MAPPING[2][:id])
      elsif user_type_id == USER_MAPPING[2][:id]
        @requestors = RequestAccess.where(grantor_id: current_user.id, :status => RECORD_ACCESS_STATUS[0])
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
    request_access.status = RECORD_ACCESS_STATUS[1]
    request_access.save!
    listing
    render :listing
  end

  def deny_request
    request_access = RequestAccess.where(grantor_id: params[:user_id], requestor_id: params[:requestor_id], document_id: params[:document_id]).first
    request_access.status = RECORD_ACCESS_STATUS[2]
    request_access.save!
    listing
    render :listing
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
