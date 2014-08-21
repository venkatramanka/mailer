require 'test_helper'

class LoginusersControllerTest < ActionController::TestCase
  setup do
    @loginuser = loginusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loginusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loginuser" do
    assert_difference('Loginuser.count') do
      post :create, loginuser: { emailId: @loginuser.emailId, password: @loginuser.password, user_id: @loginuser.user_id }
    end

    assert_redirected_to loginuser_path(assigns(:loginuser))
  end

  test "should show loginuser" do
    get :show, id: @loginuser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loginuser
    assert_response :success
  end

  test "should update loginuser" do
    put :update, id: @loginuser, loginuser: { emailId: @loginuser.emailId, password: @loginuser.password, user_id: @loginuser.user_id }
    assert_redirected_to loginuser_path(assigns(:loginuser))
  end

  test "should destroy loginuser" do
    assert_difference('Loginuser.count', -1) do
      delete :destroy, id: @loginuser
    end

    assert_redirected_to loginusers_path
  end
end
