require 'test_helper'

class Backend::AdminsControllerTest < ActionController::TestCase
  setup do
    @backend_admin = backend_admins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backend_admins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backend_admin" do
    assert_difference('Backend::Admin.count') do
      post :create, backend_admin: { bio: @backend_admin.bio, email: @backend_admin.email, hashed_password: @backend_admin.hashed_password, is_root: @backend_admin.is_root, login: @backend_admin.login, name: @backend_admin.name, salt: @backend_admin.salt, surname: @backend_admin.surname }
    end

    assert_redirected_to backend_admin_path(assigns(:backend_admin))
  end

  test "should show backend_admin" do
    get :show, id: @backend_admin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backend_admin
    assert_response :success
  end

  test "should update backend_admin" do
    put :update, id: @backend_admin, backend_admin: { bio: @backend_admin.bio, email: @backend_admin.email, hashed_password: @backend_admin.hashed_password, is_root: @backend_admin.is_root, login: @backend_admin.login, name: @backend_admin.name, salt: @backend_admin.salt, surname: @backend_admin.surname }
    assert_redirected_to backend_admin_path(assigns(:backend_admin))
  end

  test "should destroy backend_admin" do
    assert_difference('Backend::Admin.count', -1) do
      delete :destroy, id: @backend_admin
    end

    assert_redirected_to backend_admins_path
  end
end
