class CashBalancesController < ApplicationController
  before_action :set_cash_balance, only: [:show, :edit, :update, :destroy]

  # GET /cash_balances
  # GET /cash_balances.json
  def index
    @cash_balances = CashBalance.all
  end

  # GET /cash_balances/1
  # GET /cash_balances/1.json
  def show
  end

  # GET /cash_balances/new
  def new
    @cash_balance = CashBalance.new
  end

  # GET /cash_balances/1/edit
  def edit
  end

  # POST /cash_balances
  # POST /cash_balances.json
  def create
    @cash_balance = CashBalance.new(cash_balance_params)

    respond_to do |format|
      if @cash_balance.save
        format.html { redirect_to @cash_balance, notice: 'Cash balance was successfully created.' }
        format.json { render :show, status: :created, location: @cash_balance }
      else
        format.html { render :new }
        format.json { render json: @cash_balance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cash_balances/1
  # PATCH/PUT /cash_balances/1.json
  def update
    respond_to do |format|
      if @cash_balance.update(cash_balance_params)
        format.html { redirect_to @cash_balance, notice: 'Cash balance was successfully updated.' }
        format.json { render :show, status: :ok, location: @cash_balance }
      else
        format.html { render :edit }
        format.json { render json: @cash_balance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cash_balances/1
  # DELETE /cash_balances/1.json
  def destroy
    @cash_balance.destroy
    respond_to do |format|
      format.html { redirect_to cash_balances_url, notice: 'Cash balance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cash_balance
      @cash_balance = CashBalance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cash_balance_params
      params.require(:cash_balance).permit(:amount, :User_id)
    end
end
