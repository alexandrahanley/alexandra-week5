class LocationsController < ApplicationController

  def index
  @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.find(params[:id])
  end

  def show
    @location = Location.find(params[:id])
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
  end

  def destroy
  end

end
