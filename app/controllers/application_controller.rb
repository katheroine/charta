class CurrentAdmin
	def initialize session
		@session = session
	end

	def admin_instance
		Admin.find_by_id(@session[:admin_id])
	end
	
	def id
		@session[:admin_id]
	end

	def signed_in?
		!!@session[:admin_id]
	end
	
	def signed_out?
		!@session[:admin_id]
	end
	
	def sign_in(login, password)
		admin = Admin.authenticate(login, password)
		
		if admin
			@session[:admin_id] = admin.id
		else
			nil
		end
	end
	
	def sign_out
		@session[:admin_id] = nil
	end
	
	def is_root?
		if signed_in?
			admin_instance.is_root
		else
			false
		end
	end
end

class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_admin
  
  def current_admin
		CurrentAdmin.new(session)
  end
end
