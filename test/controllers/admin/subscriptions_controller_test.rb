require 'test_helper'

class Admin::SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_subscription = admin_subscriptions(:one)
  end

  test "should get index" do
    get admin_subscriptions_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_subscription_url
    assert_response :success
  end

  test "should create admin_subscription" do
    assert_difference('Admin::Subscription.count') do
      post admin_subscriptions_url, params: { admin_subscription: {  } }
    end

    assert_redirected_to admin_subscription_url(Admin::Subscription.last)
  end

  test "should show admin_subscription" do
    get admin_subscription_url(@admin_subscription)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_subscription_url(@admin_subscription)
    assert_response :success
  end

  test "should update admin_subscription" do
    patch admin_subscription_url(@admin_subscription), params: { admin_subscription: {  } }
    assert_redirected_to admin_subscription_url(@admin_subscription)
  end

  test "should destroy admin_subscription" do
    assert_difference('Admin::Subscription.count', -1) do
      delete admin_subscription_url(@admin_subscription)
    end

    assert_redirected_to admin_subscriptions_url
  end
end
