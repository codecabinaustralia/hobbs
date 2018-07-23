require 'test_helper'

class ProjectDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_document = project_documents(:one)
  end

  test "should get index" do
    get project_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_project_document_url
    assert_response :success
  end

  test "should create project_document" do
    assert_difference('ProjectDocument.count') do
      post project_documents_url, params: { project_document: { description: @project_document.description, title: @project_document.title } }
    end

    assert_redirected_to project_document_url(ProjectDocument.last)
  end

  test "should show project_document" do
    get project_document_url(@project_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_document_url(@project_document)
    assert_response :success
  end

  test "should update project_document" do
    patch project_document_url(@project_document), params: { project_document: { description: @project_document.description, title: @project_document.title } }
    assert_redirected_to project_document_url(@project_document)
  end

  test "should destroy project_document" do
    assert_difference('ProjectDocument.count', -1) do
      delete project_document_url(@project_document)
    end

    assert_redirected_to project_documents_url
  end
end
