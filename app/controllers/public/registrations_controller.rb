# frozen_string_literal: true

class Public::RegistrationsController < Devise::RegistrationsController
  before_action :customer_state, only: [:create]



  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def after_sign_up_path_for(resouce)
    my_page_path
  end


  protected

  def customer_state
    @customer = Customer.find_by(email: params[:customer][:email])
      return if !@customer
      if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted == true
        flash[:notice] = "退会済みの為、再登録が必要です。"
        redirect_to new_customer_session_path
      end
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
