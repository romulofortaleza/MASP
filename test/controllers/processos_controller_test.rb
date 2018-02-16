require 'test_helper'

class ProcessosControllerTest < ActionDispatch::IntegrationTest
  test "should get listaprocessos" do
    get processos_listaprocessos_url
    assert_response :success
  end

end
