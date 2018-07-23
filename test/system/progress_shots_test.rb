require "application_system_test_case"

class ProgressShotsTest < ApplicationSystemTestCase
  setup do
    @progress_shot = progress_shots(:one)
  end

  test "visiting the index" do
    visit progress_shots_url
    assert_selector "h1", text: "Progress Shots"
  end

  test "creating a Progress shot" do
    visit progress_shots_url
    click_on "New Progress Shot"

    fill_in "Description", with: @progress_shot.description
    fill_in "Project", with: @progress_shot.project_id
    fill_in "Title", with: @progress_shot.title
    click_on "Create Progress shot"

    assert_text "Progress shot was successfully created"
    click_on "Back"
  end

  test "updating a Progress shot" do
    visit progress_shots_url
    click_on "Edit", match: :first

    fill_in "Description", with: @progress_shot.description
    fill_in "Project", with: @progress_shot.project_id
    fill_in "Title", with: @progress_shot.title
    click_on "Update Progress shot"

    assert_text "Progress shot was successfully updated"
    click_on "Back"
  end

  test "destroying a Progress shot" do
    visit progress_shots_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Progress shot was successfully destroyed"
  end
end
