require 'test_helper'

class ProgressShotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @progress_shot = progress_shots(:one)
  end

  test "should get index" do
    get progress_shots_url
    assert_response :success
  end

  test "should get new" do
    get new_progress_shot_url
    assert_response :success
  end

  test "should create progress_shot" do
    assert_difference('ProgressShot.count') do
      post progress_shots_url, params: { progress_shot: { description: @progress_shot.description, project_id: @progress_shot.project_id, title: @progress_shot.title } }
    end

    assert_redirected_to progress_shot_url(ProgressShot.last)
  end

  test "should show progress_shot" do
    get progress_shot_url(@progress_shot)
    assert_response :success
  end

  test "should get edit" do
    get edit_progress_shot_url(@progress_shot)
    assert_response :success
  end

  test "should update progress_shot" do
    patch progress_shot_url(@progress_shot), params: { progress_shot: { description: @progress_shot.description, project_id: @progress_shot.project_id, title: @progress_shot.title } }
    assert_redirected_to progress_shot_url(@progress_shot)
  end

  test "should destroy progress_shot" do
    assert_difference('ProgressShot.count', -1) do
      delete progress_shot_url(@progress_shot)
    end

    assert_redirected_to progress_shots_url
  end
end
