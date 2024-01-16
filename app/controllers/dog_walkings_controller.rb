class DogWalkingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    dog_walkings = DogWalking.all

    render json: dog_walkings.to_json
  end

  def recent_index
    dog_walkings = DogWalking.where("scheduled_date >= '#{DateTime.now}'")

    render json: dog_walkings.to_json
  end

  def show
    dog_walking = DogWalking.find(params[:identifier])

    render json: {
      status: dog_walking.status,
      scheduled_date: dog_walking.scheduled_date,
      price: dog_walking.price,
      duration: dog_walking.duration,
      latitude: dog_walking.latitude,
      longitude: dog_walking.longitude,
      pets: dog_walking.pets,
      begins: dog_walking.begins,
      ends: dog_walking.ends,
      real_duration_seconds: calculate_duration(dog_walking.begins, dog_walking.ends)
    }.to_json
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

    render json: dog_walking.to_json and return
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
      raise ActionController::BadRequest.new(), "invalid duration! only 30 or 60 are currently accepted!"
    end
  end

  def calculate_duration(start, finish)
    if start.nil? or finish.nil?
      return 0
    end

    finish - start
  end
end