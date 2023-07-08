class IncomesController < ApplicationController
  before_action :set_income, only: [:index, :create, :show, :update, :destroy]

  def show
    incomes = income.find(params[:id])
    if income
      render json: incomes 
    else 
      render json: {error: "User not found"}, status: :not_found
    end
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
    @income = current_user.incomes.find(params[:id])
  end

  def authenticate_user
    unless session[:user_id]
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
