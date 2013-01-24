class Frontend::CompanyController < Frontend::ApplicationController
  def index
	@company = Company.first
  end
end
