class Backend::CompanyController < Backend::ApplicationController
  # GET /company/
  # GET /company.json
  def show
    @company = Company.first

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end
  
  # GET /company/edit
  def edit
    @company = Company.first
  end

  # PUT /company/
  # PUT /company.json
  def update
    @company = Company.first

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to '/admin/company', notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

end
