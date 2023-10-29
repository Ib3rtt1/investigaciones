require "application_system_test_case"

class InvestigacionsTest < ApplicationSystemTestCase
  setup do
    @investigacion = investigacions(:one)
  end

  test "visiting the index" do
    visit investigacions_url
    assert_selector "h1", text: "Investigacions"
  end

  test "should create investigacion" do
    visit investigacions_url
    click_on "New investigacion"

    fill_in "Date", with: @investigacion.date
    fill_in "Name", with: @investigacion.name
    fill_in "Resume", with: @investigacion.resume
    fill_in "Title", with: @investigacion.title
    click_on "Create Investigacion"

    assert_text "Investigacion was successfully created"
    click_on "Back"
  end

  test "should update Investigacion" do
    visit investigacion_url(@investigacion)
    click_on "Edit this investigacion", match: :first

    fill_in "Date", with: @investigacion.date
    fill_in "Name", with: @investigacion.name
    fill_in "Resume", with: @investigacion.resume
    fill_in "Title", with: @investigacion.title
    click_on "Update Investigacion"

    assert_text "Investigacion was successfully updated"
    click_on "Back"
  end

  test "should destroy Investigacion" do
    visit investigacion_url(@investigacion)
    click_on "Destroy this investigacion", match: :first

    assert_text "Investigacion was successfully destroyed"
  end
end
