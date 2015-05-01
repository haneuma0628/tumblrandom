require 'test_helper'

class CertificationsControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get retry" do
    get :retry
    assert_response :success
  end

end
