require "test_helper"

class PlayersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get players_new_url
    assert_response :success
  end

  test "should get create" do
    get players_create_url
    assert_response :success
  end

  test "should get edit" do
    get players_edit_url
    assert_response :success
  end
end
