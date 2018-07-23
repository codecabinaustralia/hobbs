require 'test_helper'

class ItemGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_group = item_groups(:one)
  end

  test "should get index" do
    get item_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_item_group_url
    assert_response :success
  end

  test "should create item_group" do
    assert_difference('ItemGroup.count') do
      post item_groups_url, params: { item_group: { description: @item_group.description, title: @item_group.title } }
    end

    assert_redirected_to item_group_url(ItemGroup.last)
  end

  test "should show item_group" do
    get item_group_url(@item_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_group_url(@item_group)
    assert_response :success
  end

  test "should update item_group" do
    patch item_group_url(@item_group), params: { item_group: { description: @item_group.description, title: @item_group.title } }
    assert_redirected_to item_group_url(@item_group)
  end

  test "should destroy item_group" do
    assert_difference('ItemGroup.count', -1) do
      delete item_group_url(@item_group)
    end

    assert_redirected_to item_groups_url
  end
end
