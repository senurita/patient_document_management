class UsersController < ApplicationController

  def listing
  	if user_signed_in?
      role = UserType.where(:id => current_user.user_type_id).first.name
      if role == "Doctor" || role == "Pharmacist"
      @access_requested_patients = RequestAccess.where(requestor_id: current_user.id)

      if @access_requested_patients.blank?
      @access_not_requested_patients = User.where('user_type_id = (?)',2)
      else
      @access_not_requested_patients = User.where('user_type_id = (?) AND id NOT IN (?)', 2, @access_requested_patients.pluck(:grantor_id))
      end

    elsif role == "Patient"
      @requestors = RequestAccess.where(grantor_id: current_user.id, :status => "pending")
    end 
  else
    render :welcome
    end 
  end

  def create_request
    request_access = RequestAccess.create(requestor_id: params[:user_id], grantor_id: params[:patient_id])
    listing
    render :listing
  end

  def approve_request
    request_access = RequestAccess.where(grantor_id: params[:user_id], requestor_id: params[:requestor_id]).first
    request_access.status = "approved"
    request_access.save!
    listing
    render :listing
  end

  def deny_request
    request_access = RequestAccess.where(grantor_id: params[:user_id], requestor_id: params[:requestor_id]).first
    request_access.status = "denied"
    request_access.save!
    listing
    render :listing
  end

  def view_document
    role = UserType.where(:id => current_user.user_type_id).first.name
    @documents = User.where(id: params[:patient_id]).first.documents
    byebug
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
