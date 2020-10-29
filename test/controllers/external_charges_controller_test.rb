require 'test_helper'

class ExternalChargesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get external_charges_index_url
    assert_response :success
  end

end
