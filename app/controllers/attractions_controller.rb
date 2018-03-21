class AttractionsController < ApplicationController
  before_action :find_attraction, only: [:show, :edit, :update]

  def index
    @attractions = Attraction.all
  end

  def show
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to @attraction
  end

  def edit
  end

  def update
    if current_user.admin && @attraction.update(attraction_params)
      redirect_to @attraction
    else
      redirect_to edit_attraction_path
    end
  end

  def ride
    @ride = Ride.new(attraction_id: params[:id], user_id: current_user.id)
    if flash[:message] = @ride.take_ride
      redirect_to current_user
    else
      render show
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

  def find_attraction
    @attraction = Attraction.find(params[:id])
  end
end
