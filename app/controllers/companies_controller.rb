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
    Company.create(company_params)
    redirect_to '/companies'
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    company = Company.find(params[:id])
    company.update({
      name: params[:name],
      based_in_co: params[:based_in_co],
      year_founded: params[:year_founded]
      })
      company.save
      redirect_to "/companies/#{company.id}"
    end
    
    def destroy
      company = Company.find(params[:id])
      company.destroy
      redirect_to "/companies"
    end

  private

    def company_params
      params.permit(:name, :based_in_co, :year_founded)
    end
end