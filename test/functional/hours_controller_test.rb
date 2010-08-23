require 'test_helper'

class HoursControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hour" do
    assert_difference('Hour.count') do
      post :create, :hour => { }
    end

    assert_redirected_to hour_path(assigns(:hour))
  end

  test "should show hour" do
    get :show, :id => hours(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => hours(:one).to_param
    assert_response :success
  end

  test "should update hour" do
    put :update, :id => hours(:one).to_param, :hour => { }
    assert_redirected_to hour_path(assigns(:hour))
  end

  test "should destroy hour" do
    assert_difference('Hour.count', -1) do
      delete :destroy, :id => hours(:one).to_param
    end

    assert_redirected_to hours_path
  end
end
