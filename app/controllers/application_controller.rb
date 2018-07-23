class ApplicationController < ActionController::Base
	before_action :company_profile
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :authenticate_user!

	def company_profile
		@company_profile = CompanySetting.first
		
		if @company_profile.category_based == true
			@category_based = true
		else
			@category_based = false
		end
	end

	protected

	  def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar, :admin, :client, :master_admin, :first_name, :last_name, :phone, :address, :city, :state, :postcode, :country])
	    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name, :phone, :address, :city, :state, :postcode, :country, :avatar])
		devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :admin, :client, :master_admin, :first_name, :last_name, :phone, :address, :city, :state, :postcode, :country])
	  end

	
end
