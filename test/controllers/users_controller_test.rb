require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get dashbord" do
    get :dashbord
    assert_response :success
  end

  test "should get reblog" do
    get :reblog
    assert_response :success
  end

  test "should get like" do
    get :like
    assert_response :success
  end

  test "should get configure" do
    get :configure
    assert_response :success
  end

  test "should get select_view_blog" do
    get :select_view_blog
    assert_response :success
  end

  test "should get select_action_blog" do
    get :select_action_blog
    assert_response :success
  end

end
