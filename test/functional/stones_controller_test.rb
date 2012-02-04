require 'test_helper'

class StonesControllerTest < ActionController::TestCase
  setup do
    @stone = stones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stone" do
    assert_difference('Stone.count') do
      post :create, :stone => @stone.attributes
    end

    assert_redirected_to stone_path(assigns(:stone))
  end

  test "should show stone" do
    get :show, :id => @stone.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @stone.to_param
    assert_response :success
  end

  test "should update stone" do
    put :update, :id => @stone.to_param, :stone => @stone.attributes
    assert_redirected_to stone_path(assigns(:stone))
  end

  test "should destroy stone" do
    assert_difference('Stone.count', -1) do
      delete :destroy, :id => @stone.to_param
    end

    assert_redirected_to stones_path
  end
end
