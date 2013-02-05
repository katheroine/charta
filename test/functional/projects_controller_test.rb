require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { completion_date: @project.completion_date, construction_img_path: @project.construction_img_path, localization: @project.localization, name: @project.name, project_img_path: @project.project_img_path, result_img_path: @project.result_img_path, rooms_number: @project.rooms_number, state: @project.state, surface_area: @project.surface_area }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    put :update, id: @project, project: { completion_date: @project.completion_date, construction_img_path: @project.construction_img_path, localization: @project.localization, name: @project.name, project_img_path: @project.project_img_path, result_img_path: @project.result_img_path, rooms_number: @project.rooms_number, state: @project.state, surface_area: @project.surface_area }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
end
