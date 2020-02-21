require 'rails_helper'

describe DogWalkingsController do
  
  context '#index' do

    it 'should return 200' do
      get :index
      expect(response.status).to eq(200)
    end

  end

end