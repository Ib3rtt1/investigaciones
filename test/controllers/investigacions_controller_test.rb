require "test_helper"

class InvestigacionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @investigacion = investigacions(:one)
  end

  test "should get index" do
    get investigacions_url
    assert_response :success
  end

  test "should get new" do
    get new_investigacion_url
    assert_response :success
  end

  test "should create investigacion" do
    assert_difference("Investigacion.count") do
      post investigacions_url, params: { investigacion: { date: @investigacion.date, name: @investigacion.name, resume: @investigacion.resume, title: @investigacion.title } }
    end

    assert_redirected_to investigacion_url(Investigacion.last)
  end

  test "should show investigacion" do
    get investigacion_url(@investigacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_investigacion_url(@investigacion)
    assert_response :success
  end

  test "should update investigacion" do
    patch investigacion_url(@investigacion), params: { investigacion: { date: @investigacion.date, name: @investigacion.name, resume: @investigacion.resume, title: @investigacion.title } }
    assert_redirected_to investigacion_url(@investigacion)
  end

  test "should destroy investigacion" do
    assert_difference("Investigacion.count", -1) do
      delete investigacion_url(@investigacion)
    end

    assert_redirected_to investigacions_url
  end
end
