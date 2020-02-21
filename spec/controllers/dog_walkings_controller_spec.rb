require 'rails_helper'

describe DogWalkingsController do

  context '#index' do

    it 'should return 200' do
      get :index
      expect(response.status).to eq(200)
    end

  end

  context '#recent_index' do

    it 'should return 200' do
      get :recent_index
      expect(response.status).to eq(200)
    end

  end

  context '#show' do

    before do
      dog_walking = DogWalking.new(
                  id: 1,
                  status: 1,
                  scheduled_date: '2020-02-19 19:34:35',
                  price: 100,
                  duration: 30,
                  latitude: 10.10,
                  longitude: 10.10,
                  pets: 3,
                  begins: 0,
                  ends: 0)
      dog_walking.save!
    end

    it 'should return 200' do
      get :show, params: { identifier: 1 }
      expect(response.status).to eq(200)
    end

  end

  context '#create' do

    it 'should return 200' do
      post :create, params: { scheduled_date: '2020-02-19 19:34:35',
                      duration: 30,
                      latitude: 10.10,
                      longitude: 10.10,
                      pets: 3,
                    }, as: :json
      expect(response.status).to eq(200)
    end

    it 'should return 400 on invalid duration' do
      expect{
        post :create, params: { scheduled_date: '2020-02-19 19:34:35',
                      duration: 22,
                      latitude: 10.10,
                      longitude: 10.10,
                      pets: 3,
                    }, as: :json
      }.to raise_error(ActionController::BadRequest)
    end

  end

  context '#start_walk' do

    before do
      dog_walking = DogWalking.new(
                  id: 1,
                  status: 1,
                  scheduled_date: '2020-02-19 19:34:35',
                  price: 100,
                  duration: 30,
                  latitude: 10.10,
                  longitude: 10.10,
                  pets: 3,
                  begins: 0,
                  ends: 0)
      dog_walking.save!
    end

    it 'should return 200' do
      post :start_walk, params: { identifier: 1,  time: '10:00'}, as: :json
      expect(response.status).to eq(200)
    end

  end

  context '#finish_walk' do

    before do
      dog_walking = DogWalking.new(
                  id: 1,
                  status: 1,
                  scheduled_date: '2020-02-19 19:34:35',
                  price: 100,
                  duration: 30,
                  latitude: 10.10,
                  longitude: 10.10,
                  pets: 3,
                  begins: 0,
                  ends: 0)
      dog_walking.save!
    end

    it 'should return 200' do
      post :finish_walk, params: { identifier: 1, time: '11:00'}, as: :json
      expect(response.status).to eq(200)
    end

  end

end