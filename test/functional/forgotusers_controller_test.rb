require 'test_helper'

class ForgotusersControllerTest < ActionController::TestCase
  setup do
    @forgotuser = forgotusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forgotusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forgotuser" do
    assert_difference('Forgotuser.count') do
      post :create, forgotuser: { newPassword: @forgotuser.newPassword, securityAnswer: @forgotuser.securityAnswer, securityQuestion: @forgotuser.securityQuestion }
    end

    assert_redirected_to forgotuser_path(assigns(:forgotuser))
  end

  test "should show forgotuser" do
    get :show, id: @forgotuser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @forgotuser
    assert_response :success
  end

  test "should update forgotuser" do
    put :update, id: @forgotuser, forgotuser: { newPassword: @forgotuser.newPassword, securityAnswer: @forgotuser.securityAnswer, securityQuestion: @forgotuser.securityQuestion }
    assert_redirected_to forgotuser_path(assigns(:forgotuser))
  end

  test "should destroy forgotuser" do
    assert_difference('Forgotuser.count', -1) do
      delete :destroy, id: @forgotuser
    end

    assert_redirected_to forgotusers_path
  end
end
