class EventsController < ApplicationController
  before_filter :current_user

  def index
      @events = []
      @dogs = current_user.dogs.pluck(:name)
      @dogs.each do |dog|
        @events.push(Event.find(params[:id]))
      end
  end

  def new
    @times = ["Morning", "Afternoon", "Evening", "Overnight"]
    @checked_times = []
    @dogs = current_user.dogs.pluck(:name)
    @checked_dogs = []
  end

  def create

  end

  def edit
    @event = Event.find(params[:id])
    @dog = @event.dog_id
  end

  def update

  end

  def destroy

  end

end
