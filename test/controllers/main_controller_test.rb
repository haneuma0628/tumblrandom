require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get reload" do
    get :reload
    assert_response :success
  end

  test "should get select" do
    get :select
    assert_response :success
  end

end
