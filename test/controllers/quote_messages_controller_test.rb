require 'test_helper'

class QuoteMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote_message = quote_messages(:one)
  end

  test "should get index" do
    get quote_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_quote_message_url
    assert_response :success
  end

  test "should create quote_message" do
    assert_difference('QuoteMessage.count') do
      post quote_messages_url, params: { quote_message: { body: @quote_message.body, project_id: @quote_message.project_id, user_id: @quote_message.user_id } }
    end

    assert_redirected_to quote_message_url(QuoteMessage.last)
  end

  test "should show quote_message" do
    get quote_message_url(@quote_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_quote_message_url(@quote_message)
    assert_response :success
  end

  test "should update quote_message" do
    patch quote_message_url(@quote_message), params: { quote_message: { body: @quote_message.body, project_id: @quote_message.project_id, user_id: @quote_message.user_id } }
    assert_redirected_to quote_message_url(@quote_message)
  end

  test "should destroy quote_message" do
    assert_difference('QuoteMessage.count', -1) do
      delete quote_message_url(@quote_message)
    end

    assert_redirected_to quote_messages_url
  end
end
