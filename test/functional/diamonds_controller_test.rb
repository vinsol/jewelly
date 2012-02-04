require 'test_helper'

class DiamondsControllerTest < ActionController::TestCase
  setup do
    @diamond = diamonds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:diamonds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create diamond" do
    assert_difference('Diamond.count') do
      post :create, :diamond => @diamond.attributes
    end

    assert_redirected_to diamond_path(assigns(:diamond))
  end

  test "should show diamond" do
    get :show, :id => @diamond.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @diamond.to_param
    assert_response :success
  end

  test "should update diamond" do
    put :update, :id => @diamond.to_param, :diamond => @diamond.attributes
    assert_redirected_to diamond_path(assigns(:diamond))
  end

  test "should destroy diamond" do
    assert_difference('Diamond.count', -1) do
      delete :destroy, :id => @diamond.to_param
    end

    assert_redirected_to diamonds_path
  end
end
