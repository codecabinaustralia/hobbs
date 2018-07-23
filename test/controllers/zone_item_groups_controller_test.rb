require 'test_helper'

class ZoneItemGroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get zone_groups" do
    get zone_item_groups_zone_groups_url
    assert_response :success
  end

end
