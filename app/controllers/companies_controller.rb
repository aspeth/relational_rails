class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
  end

  def create
    # require "pry"; binding.pry
    Company.create(company_params)
    redirect_to '/companies'
  end

    def company_params
      params.permit(:name, :based_in_co, :year_founded)
    end
end