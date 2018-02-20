require 'test_helper'

class ReusControllerTest < ActionDispatch::IntegrationTest
  test "should get listasecretarias" do
    get reus_listasecretarias_url
    assert_response :success
  end

end
