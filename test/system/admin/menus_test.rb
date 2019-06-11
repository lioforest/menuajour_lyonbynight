require "application_system_test_case"

class Admin::MenusTest < ApplicationSystemTestCase
  setup do
    @admin_menu = admin_menus(:one)
  end

  test "visiting the index" do
    visit admin_menus_url
    assert_selector "h1", text: "Admin/Menus"
  end

  test "creating a Menu" do
    visit admin_menus_url
    click_on "New Admin/Menu"

    click_on "Create Menu"

    assert_text "Menu was successfully created"
    click_on "Back"
  end

  test "updating a Menu" do
    visit admin_menus_url
    click_on "Edit", match: :first

    click_on "Update Menu"

    assert_text "Menu was successfully updated"
    click_on "Back"
  end

  test "destroying a Menu" do
    visit admin_menus_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Menu was successfully destroyed"
  end
end
