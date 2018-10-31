require 'test_helper'

class GoldBalancesControllerTest < ActionController::TestCase
  setup do
    @gold_balance = gold_balances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gold_balances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gold_balance" do
    assert_difference('GoldBalance.count') do
      post :create, gold_balance: { amount: @gold_balance.amount, user_id: @gold_balance.user_id }
    end

    assert_redirected_to gold_balance_path(assigns(:gold_balance))
  end

  test "should show gold_balance" do
    get :show, id: @gold_balance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gold_balance
    assert_response :success
  end

  test "should update gold_balance" do
    patch :update, id: @gold_balance, gold_balance: { amount: @gold_balance.amount, user_id: @gold_balance.user_id }
    assert_redirected_to gold_balance_path(assigns(:gold_balance))
  end

  test "should destroy gold_balance" do
    assert_difference('GoldBalance.count', -1) do
      delete :destroy, id: @gold_balance
    end

    assert_redirected_to gold_balances_path
  end
end
