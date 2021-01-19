require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attrs = attributes_for(:account)
  end

  test "should get index" do
    get accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_account_url
    assert_response :success
  end

  test "should create account" do
    assert_difference('Account.count') do
      post accounts_url, params: { account: { email: @attrs[:email], login: @attrs[:login], name: @attrs[:name], password: 'secret', password_confirmation: 'secret' } }
    end

    assert_redirected_to account_url(Account.last)
  end

  test "should show account" do
    account = create(:account)
    get account_url(account)
    assert_response :success
  end

  test "should get edit" do
    account = create(:account)
    get edit_account_url(account)
    assert_response :success
  end

  test "should update account" do
    account = create(:account)
    patch account_url(account), params: { account: { email: @attrs[:email], login: @attrs[:login], name: @attrs[:name], password: 'secret', password_confirmation: 'secret' } }
    assert_redirected_to account_url(account)
  end

  test "should destroy account" do
    account = create(:account)
    assert_difference('Account.count', -1) do
      delete account_url(account)
    end

    assert_redirected_to accounts_url
  end
end
