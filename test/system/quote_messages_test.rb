require "application_system_test_case"

class QuoteMessagesTest < ApplicationSystemTestCase
  setup do
    @quote_message = quote_messages(:one)
  end

  test "visiting the index" do
    visit quote_messages_url
    assert_selector "h1", text: "Quote Messages"
  end

  test "creating a Quote message" do
    visit quote_messages_url
    click_on "New Quote Message"

    fill_in "Body", with: @quote_message.body
    fill_in "Project", with: @quote_message.project_id
    fill_in "User", with: @quote_message.user_id
    click_on "Create Quote message"

    assert_text "Quote message was successfully created"
    click_on "Back"
  end

  test "updating a Quote message" do
    visit quote_messages_url
    click_on "Edit", match: :first

    fill_in "Body", with: @quote_message.body
    fill_in "Project", with: @quote_message.project_id
    fill_in "User", with: @quote_message.user_id
    click_on "Update Quote message"

    assert_text "Quote message was successfully updated"
    click_on "Back"
  end

  test "destroying a Quote message" do
    visit quote_messages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quote message was successfully destroyed"
  end
end
