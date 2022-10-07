# frozen_string_literal: true

class Public::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :customer_state, only: [:create]



  def after_sign_up_path_for(resouce)
    my_page_path
  end


  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :last_name,:first_name, :last_name_kana,
                                                        :first_name_kana, :postal_code, :address,
                                                        :telephone_number])
  end


  def customer_state
    @customer = Customer.find_by(email: params[:customer][:email])
      return if !@customer
      if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted == true
        flash[:notice] = "退会済みの為、再登録が必要です。"
        redirect_to new_customer_session_path
      end
  end

end
