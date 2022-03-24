class SnowboardsController < ApplicationController
  def index
    @snowboards = Snowboard.all
  end
end