# frozen_string_literal: true

require 'test_helper'

class SettingDetailsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get setting_details_create_url
    assert_response :success
  end

  test 'should get update' do
    get setting_details_update_url
    assert_response :success
  end

  test 'should get destroy' do
    get setting_details_destroy_url
    assert_response :success
  end
end
