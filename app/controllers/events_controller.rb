class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    @product.location_id = params[:location_id]
    @event = Location.find(params[:location_id])

    if @event.save
      redirect_to locations_path, notice: “You have created a product in #{@location.name}!”
    else
      render location_path(@location)
    end
  end

  private
  def event_params
    params.require(:event).permit(:description :date :requires_id)
  end


  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
