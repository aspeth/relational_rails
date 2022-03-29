class CompaniesSnowboardsController < ApplicationController
  def index
    @company = Company.find(params[:id])
  end
  
  def new
    @company = Company.find(params[:id])
  end

  def create
    company = Company.find(params[:id])
    snowboard = Snowboard.create(snowboard_params)
    snowboard[:company_id] = company.id
    snowboard.save
    redirect_to "/companies/#{company.id}/snowboards"
  end

  private

     def snowboard_params
      params.permit(:name, :powder_board, :length)
    end
end