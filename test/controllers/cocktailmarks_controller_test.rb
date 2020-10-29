require 'test_helper'

class CocktailmarksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cocktailmarks_index_url
    assert_response :success
  end

  test "should get create" do
    get cocktailmarks_create_url
    assert_response :success
  end

  test "should get destroy" do
    get cocktailmarks_destroy_url
    assert_response :success
  end

end