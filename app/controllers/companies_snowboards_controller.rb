class CompaniesSnowboardsController < ApplicationController
  def index
    if params[:sort] == "alpha"
      @company = Company.find(params[:id])
      @snowboards = @company.alphabetize
    elsif params[:length]
      @company = Company.find(params[:id])
      @snowboards = @company.sort_by_length(params[:length])
    else
      @company = Company.find(params[:id])
      @snowboards = @company.snowboards
    end
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