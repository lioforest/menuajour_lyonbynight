require "application_system_test_case"

class Admin::SubscriptionsTest < ApplicationSystemTestCase
  setup do
    @admin_subscription = admin_subscriptions(:one)
  end

  test "visiting the index" do
    visit admin_subscriptions_url
    assert_selector "h1", text: "Admin/Subscriptions"
  end

  test "creating a Subscription" do
    visit admin_subscriptions_url
    click_on "New Admin/Subscription"

    click_on "Create Subscription"

    assert_text "Subscription was successfully created"
    click_on "Back"
  end

  test "updating a Subscription" do
    visit admin_subscriptions_url
    click_on "Edit", match: :first

    click_on "Update Subscription"

    assert_text "Subscription was successfully updated"
    click_on "Back"
  end

  test "destroying a Subscription" do
    visit admin_subscriptions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subscription was successfully destroyed"
  end
end
