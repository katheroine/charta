class Backend::AccountController < Backend::ApplicationController
	# GET /admin/sign_in
	def sign_in
		if current_admin.signed_in? then
			flash[:notice] = "You're signed in yet."
			redirect_to '/admin/account'
		end
	end
	
	# GET /admin/sign_out
	def sign_out
		if current_admin.signed_in? then
			current_admin.sign_out
			flash[:notice] = "You've been logged out."
		else
			flash[:notice] = "You haven't been signed in."
		end
		redirect_to '/admin/sign_in'
	end
	
	# POST /admin/authenticate
	def authenticate
		unless current_admin.signed_in? then
			login = params[:login]
			password = params[:password]
			admin = current_admin.sign_in(login, password)
			if admin
				flash[:notice] = "You've been successfully logged in."
				redirect_to '/admin/account'
			else
				flash[:notice] = "Wrong email or password."
				redirect_to :action => :sign_in
			end
		else
			flash[:notice] = "You're signed in yet."
		end
	end

  # GET /account/
  # GET /account.json
  def show
    @admin = Admin.find(current_admin.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin }
    end
  end
  
  # GET /account/edit
  def edit
    @admin = Admin.find(current_admin.id)
  end

  # PUT /account/
  # PUT /account.json
  def update
    @admin = Admin.find(current_admin.id)

    respond_to do |format|
			params[:admin].delete(:password) if params[:admin][:password].blank?
      if @admin.update_attributes(params[:admin])
        format.html { redirect_to '/admin/account', notice: 'Account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

end
