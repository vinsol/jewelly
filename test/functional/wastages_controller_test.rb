require 'test_helper'

class WastagesControllerTest < ActionController::TestCase
  setup do
    @wastage = wastages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wastages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wastage" do
    assert_difference('Wastage.count') do
      post :create, :wastage => @wastage.attributes
    end

    assert_redirected_to wastage_path(assigns(:wastage))
  end

  test "should show wastage" do
    get :show, :id => @wastage.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @wastage.to_param
    assert_response :success
  end

  test "should update wastage" do
    put :update, :id => @wastage.to_param, :wastage => @wastage.attributes
    assert_redirected_to wastage_path(assigns(:wastage))
  end

  test "should destroy wastage" do
    assert_difference('Wastage.count', -1) do
      delete :destroy, :id => @wastage.to_param
    end

    assert_redirected_to wastages_path
  end
end
