class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :check_active_users
  before_filter :only_signup_require_http_basic_auth
  before_filter :update_sanitized_params, if: :devise_controller?
    

    def update_sanitized_params
      devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :business_name, :password, :password_confirmation, :phone, :location, :contact_name, :role_type, :access_types, :admin_id)}
    end
    
    def after_sign_in_path_for(resource_or_scope)
      unless is_login?
        if current_user.role_type == "user" && !current_user.active
          sign_out(current_user)
          flash.clear
          flash[:alert] = "This user not active. Please contact your admin."
          root_path
        else
          root_path
        end
      end
    end

    def after_sign_up_path_for(resource_or_scope)
      after_sign_in_path_for(resource_or_scope)
    end

    def is_login?
      unless current_user 
        flash[:alert] = "Please login"
        redirect_to '/'
      end
    end
  
    def require_http_basic_auth
      authenticate_or_request_with_http_basic do |login, password|
        login == "Neeraj" && password=="Neeraj123"
      end
    end

    def only_signup_require_http_basic_auth
      if (params[:action]== "new" && is_a?(Devise::RegistrationsController))
        require_http_basic_auth
      else
      end
    end
    
    def check_active_users
      
    end
    
  end
