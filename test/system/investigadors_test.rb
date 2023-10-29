require "application_system_test_case"

class InvestigadorsTest < ApplicationSystemTestCase
  setup do
    @investigador = investigadors(:one)
  end

  test "visiting the index" do
    visit investigadors_url
    assert_selector "h1", text: "Investigadors"
  end

  test "should create investigador" do
    visit investigadors_url
    click_on "New investigador"

    fill_in "Nombre", with: @investigador.nombre
    click_on "Create Investigador"

    assert_text "Investigador was successfully created"
    click_on "Back"
  end

  test "should update Investigador" do
    visit investigador_url(@investigador)
    click_on "Edit this investigador", match: :first

    fill_in "Nombre", with: @investigador.nombre
    click_on "Update Investigador"

    assert_text "Investigador was successfully updated"
    click_on "Back"
  end

  test "should destroy Investigador" do
    visit investigador_url(@investigador)
    click_on "Destroy this investigador", match: :first

    assert_text "Investigador was successfully destroyed"
  end
end
