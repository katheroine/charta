class Backend::AccountController < Backend::ApplicationController
  # GET /company/
  # GET /company.json
  def show
    @account = Admin.find(current_admin.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account }
    end
  end
  
  # GET /company/edit
  def edit
    @account = Admin.where(current_admin.id)
  end

  # PUT /company/
  # PUT /company.json
  def update
    @account = Admin.where(current_admin.id)

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to '/admin/', notice: 'Account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

end
