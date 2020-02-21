class DogWalkingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    dog_walkings = DogWalking.all

    render json: dog_walkings.to_json
  end

  def show
    dog_walking = DogWalking.find(params[:identifier])

    render json: dog_walking.to_json
  end

  def create
    scheduled_date = params[:scheduled_date]
    latitude = params[:latitude]
    longitude = params[:longitude]
    duration = params[:duration]
    pets = params[:pets]
    
    price = calculate_price(duration, pets)

    dog_walking = DogWalking.new(
      status: 1,
      scheduled_date: scheduled_date,
      price: price,
      duration: duration,
      latitude: latitude,
      longitude: longitude,
      pets: pets,
      begins: 0,
      ends: 0)

    dog_walking.save

    render json: dog_walking.to_json
  end

  def start_walk
    dog_walking = DogWalking.find(params[:identifier])

    dog_walking.begins = params[:time]

    dog_walking.save

    render json: dog_walking.to_json
  end

  def finish_walk
    dog_walking = DogWalking.find(params[:identifier])

    dog_walking.ends = params[:time]

    dog_walking.save

    render json: dog_walking.to_json
  end

  private
  def calculate_price(duration, pets)
    if duration == 30
      25 + (pets - 1) * 15
    elsif duration == 60
      35 + (pets -1) * 20
    else
      head :bad_request
    end
  end
end