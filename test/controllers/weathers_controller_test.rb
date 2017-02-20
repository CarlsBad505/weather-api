require 'test_helper'

class WeathersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get weathers_index_url
    assert_response :success
  end

  test "should get search" do
    get weathers_search_url
    assert_response :success
  end

end
