require "application_system_test_case"

class ItemGroupsTest < ApplicationSystemTestCase
  setup do
    @item_group = item_groups(:one)
  end

  test "visiting the index" do
    visit item_groups_url
    assert_selector "h1", text: "Item Groups"
  end

  test "creating a Item group" do
    visit item_groups_url
    click_on "New Item Group"

    fill_in "Description", with: @item_group.description
    fill_in "Title", with: @item_group.title
    click_on "Create Item group"

    assert_text "Item group was successfully created"
    click_on "Back"
  end

  test "updating a Item group" do
    visit item_groups_url
    click_on "Edit", match: :first

    fill_in "Description", with: @item_group.description
    fill_in "Title", with: @item_group.title
    click_on "Update Item group"

    assert_text "Item group was successfully updated"
    click_on "Back"
  end

  test "destroying a Item group" do
    visit item_groups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item group was successfully destroyed"
  end
end
