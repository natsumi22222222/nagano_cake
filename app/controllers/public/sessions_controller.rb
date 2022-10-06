# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resouce)
    root_path
  end

  def after_sign_out_path_for(resouce)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:last_name,
                                                      :first_name,
                                                      :last_name_kana,
                                                      :first_name_kana,
                                                      :postal_code,
                                                      :address,
                                                      :telephone_number,
                                                      :email])
  end

end
