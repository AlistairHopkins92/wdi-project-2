class JourneysController < ApplicationController
  before_filter :authenticate_user!, only: [:new]

  def index
  @journeys = Journey.all
  end

  def new
  @journey = Journey.new
  end

  def show
    @journey = Journey.find(params[:id])
  end

  def create
      @journey = current_user.journeys.new(journey_params)
      if @journey.save
          flash[:success] = "Your journey has been listed!"
          redirect_to journeys_path
      else
          render "new"
      end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
      def journey_params
          params.require(:journey).permit(:start_destination, :end_destination, :departure_date, :price)
      end

end
