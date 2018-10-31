require 'test_helper'

class CashBalancesControllerTest < ActionController::TestCase
  setup do
    @cash_balance = cash_balances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cash_balances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cash_balance" do
    assert_difference('CashBalance.count') do
      post :create, cash_balance: { amount: @cash_balance.amount, user_id: @cash_balance.user_id }
    end

    assert_redirected_to cash_balance_path(assigns(:cash_balance))
  end

  test "should show cash_balance" do
    get :show, id: @cash_balance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cash_balance
    assert_response :success
  end

  test "should update cash_balance" do
    patch :update, id: @cash_balance, cash_balance: { amount: @cash_balance.amount, user_id: @cash_balance.user_id }
    assert_redirected_to cash_balance_path(assigns(:cash_balance))
  end

  test "should destroy cash_balance" do
    assert_difference('CashBalance.count', -1) do
      delete :destroy, id: @cash_balance
    end

    assert_redirected_to cash_balances_path
  end
end
