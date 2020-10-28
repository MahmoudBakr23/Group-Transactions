require 'test_helper'

class ChargesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get charges_index_url
    assert_response :success
  end

  test "should get show" do
    get charges_show_url
    assert_response :success
  end

  test "should get new" do
    get charges_new_url
    assert_response :success
  end

  test "should get create" do
    get charges_create_url
    assert_response :success
  end

  test "should get edit" do
    get charges_edit_url
    assert_response :success
  end

  test "should get update" do
    get charges_update_url
    assert_response :success
  end

  test "should get destroy" do
    get charges_destroy_url
    assert_response :success
  end

end
