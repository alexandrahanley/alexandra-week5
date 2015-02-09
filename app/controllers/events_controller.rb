class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def create
    @location = Location.find(params[:location_id])
    @event = Event.new(event_params)
    @event.location_id = params[:location_id]

    if @event.save
      redirect_to location_event_path(@location, @event)
    else
      render location_path(@location)
    end
  end

  def new
    @location = Location.find(params[:location_id])
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @location = Location.find(params[:location_id])

  end

  def edit
    @event = Event.find(params[:id])
    @location = Location.find(params[:location_id])

  end

  def update
    @location = Location.find(params[:location_id])
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to location_event_path(@location, @event), notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to @project, notice: 'Project was successfully deleted.'
  end





  def destroy
    @event = Event.find(params[:id])
    @location = Location.find(params[:location_id])
  end

  private
  def event_params
    params.require(:event).permit(:description, :date, :requires_id, :location_id)
  end
end
