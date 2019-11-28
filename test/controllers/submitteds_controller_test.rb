require 'test_helper'

class SubmittedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @submitted = submitteds(:one)
  end

  test "should get index" do
    get submitteds_url
    assert_response :success
  end

  test "should get new" do
    get new_submitted_url
    assert_response :success
  end

  test "should create submitted" do
    assert_difference('Submitted.count') do
      post submitteds_url, params: { submitted: { name: @submitted.name } }
    end

    assert_redirected_to submitted_url(Submitted.last)
  end

  test "should show submitted" do
    get submitted_url(@submitted)
    assert_response :success
  end

  test "should get edit" do
    get edit_submitted_url(@submitted)
    assert_response :success
  end

  test "should update submitted" do
    patch submitted_url(@submitted), params: { submitted: { name: @submitted.name } }
    assert_redirected_to submitted_url(@submitted)
  end

  test "should destroy submitted" do
    assert_difference('Submitted.count', -1) do
      delete submitted_url(@submitted)
    end

    assert_redirected_to submitteds_url
  end
end
