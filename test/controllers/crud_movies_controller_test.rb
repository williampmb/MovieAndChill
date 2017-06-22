require 'test_helper'

class CrudMoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get crud_movies_index_url
    assert_response :success
  end

  test "should get new" do
    get crud_movies_new_url
    assert_response :success
  end

  test "should get create" do
    get crud_movies_create_url
    assert_response :success
  end

  test "should get update" do
    get crud_movies_update_url
    assert_response :success
  end

  test "should get edit" do
    get crud_movies_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get crud_movies_destroy_url
    assert_response :success
  end

  test "should get show" do
    get crud_movies_show_url
    assert_response :success
  end

end
