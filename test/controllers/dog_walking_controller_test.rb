require 'test_helper'

class DogWalkingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dog_walking_index_url
    assert_response :success
  end

  test "should get show" do
    get dog_walking_show_url
    assert_response :success
  end

  test "should get create" do
    get dog_walking_create_url
    assert_response :success
  end

  test "should get start_walk" do
    get dog_walking_start_walk_url
    assert_response :success
  end

  test "should get finish_walk" do
    get dog_walking_finish_walk_url
    assert_response :success
  end

end
