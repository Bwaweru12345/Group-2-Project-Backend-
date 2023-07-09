class IncomesController < ApplicationController
  before_action :set_income, only: [:show, :update, :destroy]
  skip_before_action :authorized, only: [:show]

  def show
    render json: @income
  end

  def index
    incomes = current_user.incomes
    render json: incomes
  end

  def create
    income = current_user.incomes.build(income_params)
    if income.save
      render json: income, status: :created
    else
      render json: { errors: income.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @income.update(income_params)
      render json: @income
    else
      render json: { errors: @income.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @income.destroy
    head :no_content
  end

  private

  def income_params
    params.require(:income).permit(:name, :amount)
  end

  def set_income
    @income = Income.find(params[:id])
  end
end