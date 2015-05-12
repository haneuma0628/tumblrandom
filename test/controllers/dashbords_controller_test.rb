require 'test_helper'

class DashbordsControllerTest < ActionController::TestCase
  test "should get reblog" do
    get :reblog
    assert_response :success
  end

  test "should get like" do
    get :like
    assert_response :success
  end

  test "should get view_random" do
    get :view_random
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

  test "should get select_active_blog" do
    get :select_active_blog
    assert_response :success
  end

end
