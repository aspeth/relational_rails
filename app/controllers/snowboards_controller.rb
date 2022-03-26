class SnowboardsController < ApplicationController
  def index
    @snowboards = Snowboard.all
  end

  def show
    @snowboard = Snowboard.find(params[:id])
  end
end