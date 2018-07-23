require "application_system_test_case"

class ProjectDocumentsTest < ApplicationSystemTestCase
  setup do
    @project_document = project_documents(:one)
  end

  test "visiting the index" do
    visit project_documents_url
    assert_selector "h1", text: "Project Documents"
  end

  test "creating a Project document" do
    visit project_documents_url
    click_on "New Project Document"

    fill_in "Description", with: @project_document.description
    fill_in "Title", with: @project_document.title
    click_on "Create Project document"

    assert_text "Project document was successfully created"
    click_on "Back"
  end

  test "updating a Project document" do
    visit project_documents_url
    click_on "Edit", match: :first

    fill_in "Description", with: @project_document.description
    fill_in "Title", with: @project_document.title
    click_on "Update Project document"

    assert_text "Project document was successfully updated"
    click_on "Back"
  end

  test "destroying a Project document" do
    visit project_documents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project document was successfully destroyed"
  end
end
