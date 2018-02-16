require 'test_helper'

class ReusControllerTest < ActionDispatch::IntegrationTest
  test "should get listareus" do
    get reus_listareus_url
    assert_response :success
  end

end
