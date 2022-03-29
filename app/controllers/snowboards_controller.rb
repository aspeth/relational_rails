class SnowboardsController < ApplicationController
  def index
    @snowboards = Snowboard.all
  end

  def show
    @snowboard = Snowboard.find(params[:id])
  end
  
  def edit
    @snowboard = Snowboard.find(params[:id])
  end

  def update
    snowboard = Snowboard.find(params[:id])
    snowboard.update({
      name: params[:name],
      powder_board: params[:powder_board],
      length: params[:length]
    })
    snowboard.save
    redirect_to "/snowboards/#{snowboard.id}"
  end


end