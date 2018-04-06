class ApisController < ApplicationController
  before_action :set_api, only: [:show, :edit, :update, :destroy]

  def transactions
    tranactions = Transaction.all
    render json: tranactions.to_json, status: :successfully
  end

  def top_up
    amount = params["amount"]
    txref = params["txref"] || ""

    p current_user

    bl = CashBalance.find_by(user_id: current_user.id)
    bl.amount += amount.to_f
    bl.save

    t = Transaction.create(txref: txref, t: "top_up", amount: amount, asset: "cash")

    render json: {result: "ok"}.to_json, status: :successfully

  end

  def buy
    rateG2C = 1.0/10

    amount = params["amount"]
    txref = params["txref"] || ""

    bl = CashBalance.find_by(user_id: current_user.id)
    bl.amount -= amount.to_f
    bl.save

    gb = GoldBalance.find_by(user_id: current_user.id)
    gb.amount += amount.to_f * rateG2C
    gb.save

    t = Transaction.create(txref: txref, t: "buy", amount: amount, asset: "gold")

    render json: {result: "ok"}.to_json, status: :successfully

  end

  def sell
    rateG2C = 1.0/10

    amount = params["amount"]
    txref = params["txref"] || ""
    
    bl = CashBalance.find_by(user_id: current_user.id)
    bl.amount += amount.to_f
    bl.save

    gb = GoldBalance.find_by(user_id: current_user.id)
    gb.amount -= amount.to_f * rateG2C
    gb.save

    t = Transaction.create(txref: txref, t: "sell", amount: amount, asset: "gold")

    render json: {result: "ok"}.to_json, status: :successfully
  end

  def balances
    bl = CashBalance.find_by(user_id: current_user.id)
    gb = GoldBalance.find_by(user_id: current_user.id)

    render json: {GLD: gb.amount, CASH: bl.amount}.to_json, status: :successfully
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api
      @api = Api.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_params
      params.fetch(:api, {})
    end
end
