class Backend::ApplicationController < ApplicationController
  layout "backend"
  before_filter :require_signed_in_admin, :except => [:sign_in, :authenticate]
  
  def require_signed_in_admin
	unless current_admin.signed_in?
		flash[:notice] = "You must be signed in admnistrator for this activity"
		redirect_to '/admin/sign_in'
	end
  end
end
