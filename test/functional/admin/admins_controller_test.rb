require 'test_helper'

class Admin::AdminsControllerTest < ActionController::TestCase
  setup do
    @admin_admin = admin_admins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_admins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_admin" do
    assert_difference('Admin::Admin.count') do
      post :create, admin_admin: { bio: @admin_admin.bio, email: @admin_admin.email, hashed_password: @admin_admin.hashed_password, is_root: @admin_admin.is_root, login: @admin_admin.login, name: @admin_admin.name, salt: @admin_admin.salt, surname: @admin_admin.surname }
    end

    assert_redirected_to admin_admin_path(assigns(:admin_admin))
  end

  test "should show admin_admin" do
    get :show, id: @admin_admin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_admin
    assert_response :success
  end

  test "should update admin_admin" do
    put :update, id: @admin_admin, admin_admin: { bio: @admin_admin.bio, email: @admin_admin.email, hashed_password: @admin_admin.hashed_password, is_root: @admin_admin.is_root, login: @admin_admin.login, name: @admin_admin.name, salt: @admin_admin.salt, surname: @admin_admin.surname }
    assert_redirected_to admin_admin_path(assigns(:admin_admin))
  end

  test "should destroy admin_admin" do
    assert_difference('Admin::Admin.count', -1) do
      delete :destroy, id: @admin_admin
    end

    assert_redirected_to admin_admins_path
  end
end
