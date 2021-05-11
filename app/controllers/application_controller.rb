class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    # before_action :set_current_user
    # @current_user=User.find_by(id: session[:user_id])
    
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end
  
  protected
  
  # def autheniticate_user
  #   if @current_user==nil
  #     flash[:notice]="ログインが必要です"
  #     redirect_to("/login")
  #   end
  # end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
  end

end
