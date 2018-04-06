class GoldBalancesController < ApplicationController
  before_action :set_gold_balance, only: [:show, :edit, :update, :destroy]

  # GET /gold_balances
  # GET /gold_balances.json
  def index
    @gold_balances = GoldBalance.all
  end

  # GET /gold_balances/1
  # GET /gold_balances/1.json
  def show
  end

  # GET /gold_balances/new
  def new
    @gold_balance = GoldBalance.new
  end

  # GET /gold_balances/1/edit
  def edit
  end

  # POST /gold_balances
  # POST /gold_balances.json
  def create
    @gold_balance = GoldBalance.new(gold_balance_params)

    respond_to do |format|
      if @gold_balance.save
        format.html { redirect_to @gold_balance, notice: 'Gold balance was successfully created.' }
        format.json { render :show, status: :created, location: @gold_balance }
      else
        format.html { render :new }
        format.json { render json: @gold_balance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gold_balances/1
  # PATCH/PUT /gold_balances/1.json
  def update
    respond_to do |format|
      if @gold_balance.update(gold_balance_params)
        format.html { redirect_to @gold_balance, notice: 'Gold balance was successfully updated.' }
        format.json { render :show, status: :ok, location: @gold_balance }
      else
        format.html { render :edit }
        format.json { render json: @gold_balance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gold_balances/1
  # DELETE /gold_balances/1.json
  def destroy
    @gold_balance.destroy
    respond_to do |format|
      format.html { redirect_to gold_balances_url, notice: 'Gold balance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gold_balance
      @gold_balance = GoldBalance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gold_balance_params
      params.require(:gold_balance).permit(:amount, :User_id)
    end
end
