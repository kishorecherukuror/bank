require 'test_helper'

class TranscationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transcation = transcations(:one)
  end

  test "should get index" do
    get transcations_url
    assert_response :success
  end

  test "should get new" do
    get new_transcation_url
    assert_response :success
  end

  test "should create transcation" do
    assert_difference('Transcation.count') do
      post transcations_url, params: { transcation: { transaction_id: @transcation.transaction_id, transcation_date: @transcation.transcation_date, transcation_type: @transcation.transcation_type } }
    end

    assert_redirected_to transcation_url(Transcation.last)
  end

  test "should show transcation" do
    get transcation_url(@transcation)
    assert_response :success
  end

  test "should get edit" do
    get edit_transcation_url(@transcation)
    assert_response :success
  end

  test "should update transcation" do
    patch transcation_url(@transcation), params: { transcation: { transaction_id: @transcation.transaction_id, transcation_date: @transcation.transcation_date, transcation_type: @transcation.transcation_type } }
    assert_redirected_to transcation_url(@transcation)
  end

  test "should destroy transcation" do
    assert_difference('Transcation.count', -1) do
      delete transcation_url(@transcation)
    end

    assert_redirected_to transcations_url
  end
end
