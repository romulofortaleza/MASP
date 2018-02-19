require 'test_helper'

class AudienciasControllerTest < ActionDispatch::IntegrationTest
  test "should get listaaudiencias" do
    get audiencias_listaaudiencias_url
    assert_response :success
  end

end
