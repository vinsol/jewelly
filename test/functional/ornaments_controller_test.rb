require 'test_helper'

class OrnamentsControllerTest < ActionController::TestCase
  setup do
    @ornament = ornaments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ornaments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ornament" do
    assert_difference('Ornament.count') do
      post :create, :ornament => @ornament.attributes
    end

    assert_redirected_to ornament_path(assigns(:ornament))
  end

  test "should show ornament" do
    get :show, :id => @ornament.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ornament.to_param
    assert_response :success
  end

  test "should update ornament" do
    put :update, :id => @ornament.to_param, :ornament => @ornament.attributes
    assert_redirected_to ornament_path(assigns(:ornament))
  end

  test "should destroy ornament" do
    assert_difference('Ornament.count', -1) do
      delete :destroy, :id => @ornament.to_param
    end

    assert_redirected_to ornaments_path
  end
end
