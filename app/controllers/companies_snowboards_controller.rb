class CompaniesSnowboardsController < ApplicationController
  def index
    @company = Company.find(params[:id])
  end
end