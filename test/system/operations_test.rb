require "application_system_test_case"

class OperationsTest < ApplicationSystemTestCase
  setup do
    @operation = operations(:one)
  end

  test "visiting the index.html.erb" do
    visit operations_url
    assert_selector "h1", text: "Operations"
  end

  test "should create operation" do
    visit operations_url
    click_on "New operation"

    fill_in "Amount", with: @operation.amount
    fill_in "Category", with: @operation.category_id
    fill_in "Description", with: @operation.description
    fill_in "Odate", with: @operation.odate
    fill_in "Otype", with: @operation.otype
    click_on "Create Operation"

    assert_text "Operation was successfully created"
    click_on "Back"
  end

  test "should update Operation" do
    visit operation_url(@operation)
    click_on "Edit this operation", match: :first

    fill_in "Amount", with: @operation.amount
    fill_in "Category", with: @operation.category_id
    fill_in "Description", with: @operation.description
    fill_in "Odate", with: @operation.odate
    fill_in "Otype", with: @operation.otype
    click_on "Update Operation"

    assert_text "Operation was successfully updated"
    click_on "Back"
  end

  test "should destroy Operation" do
    visit operation_url(@operation)
    click_on "Destroy this operation", match: :first

    assert_text "Operation was successfully destroyed"
  end
end
