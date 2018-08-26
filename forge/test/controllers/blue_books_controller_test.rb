# frozen_string_literal: true

require 'test_helper'

class BlueBooksControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get blue_books_index_url
    assert_response :success
  end

  test 'should get show' do
    get blue_books_show_url
    assert_response :success
  end

  test 'should get new' do
    get blue_books_new_url
    assert_response :success
  end

  test 'should get edit' do
    get blue_books_edit_url
    assert_response :success
  end

  test 'should get create' do
    get blue_books_create_url
    assert_response :success
  end

  test 'should get update' do
    get blue_books_update_url
    assert_response :success
  end

  test 'should get destroy' do
    get blue_books_destroy_url
    assert_response :success
  end
end
