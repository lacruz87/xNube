require 'test_helper'

class ExcepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @excep = exceps(:one)
  end

  test "should get index" do
    get exceps_url
    assert_response :success
  end

  test "should get new" do
    get new_excep_url
    assert_response :success
  end

  test "should create excep" do
    assert_difference('Excep.count') do
      post exceps_url, params: { excep: { part: @excep.part } }
    end

    assert_redirected_to excep_url(Excep.last)
  end

  test "should show excep" do
    get excep_url(@excep)
    assert_response :success
  end

  test "should get edit" do
    get edit_excep_url(@excep)
    assert_response :success
  end

  test "should update excep" do
    patch excep_url(@excep), params: { excep: { part: @excep.part } }
    assert_redirected_to excep_url(@excep)
  end

  test "should destroy excep" do
    assert_difference('Excep.count', -1) do
      delete excep_url(@excep)
    end

    assert_redirected_to exceps_url
  end
end
