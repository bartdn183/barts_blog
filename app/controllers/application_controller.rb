class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    around_action :user_time_zone, :if => :current_user
    
    def user_time_zone(&block)
      Time.use_zone(current_user.time_zone, &block)
    end

    protected

    def unauthorized_user!
      if current_user.role != "admin"
        redirect_to root_url
      end
    end

	def configure_permitted_parameters
	   devise_parameter_sanitizer.permit(:sign_up, keys: [:locale, :time_zone, :first_name, :last_name, :role, :city, :country, :tel])
	   devise_parameter_sanitizer.permit(:account_update, keys: [:locale, :time_zone, :first_name, :last_name, :role, :city, :country, :tel])
	end

  def after_sign_in_path_for(resource_or_scope)
      blog_posts_path
  end

end
