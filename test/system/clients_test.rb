require "application_system_test_case"

class ClientsTest < ApplicationSystemTestCase
  setup do
    @client = clients(:one)
  end

  test "visiting the index" do
    visit clients_url
    assert_selector "h1", text: "Clients"
  end

  test "creating a Client" do
    visit clients_url
    click_on "New Client"

    fill_in "Address", with: @client.address
    fill_in "City", with: @client.city
    fill_in "Full Name", with: @client.full_name
    fill_in "Full Name 2", with: @client.full_name_2
    fill_in "Phone", with: @client.phone
    fill_in "Phone 2", with: @client.phone_2
    fill_in "Postcode", with: @client.postcode
    fill_in "State", with: @client.state
    fill_in "User", with: @client.user_id
    click_on "Create Client"

    assert_text "Client was successfully created"
    click_on "Back"
  end

  test "updating a Client" do
    visit clients_url
    click_on "Edit", match: :first

    fill_in "Address", with: @client.address
    fill_in "City", with: @client.city
    fill_in "Full Name", with: @client.full_name
    fill_in "Full Name 2", with: @client.full_name_2
    fill_in "Phone", with: @client.phone
    fill_in "Phone 2", with: @client.phone_2
    fill_in "Postcode", with: @client.postcode
    fill_in "State", with: @client.state
    fill_in "User", with: @client.user_id
    click_on "Update Client"

    assert_text "Client was successfully updated"
    click_on "Back"
  end

  test "destroying a Client" do
    visit clients_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Client was successfully destroyed"
  end
end
