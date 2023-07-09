class BillsController < ApplicationController
  before_action :set_bill, only: [:update, :destroy]

  def index
    bills = current_user.bills
    render json: bills
  end

  def create
    bill = current_user.bills.build(bill_params)
    if bill.save
      render json: bill, status: :created
    else
      render json: { errors: bill.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @bill.update(bill_params)
      render json: @bill
    else
      render json: { errors: @bill.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @bill.destroy
    head :no_content
  end

  private

  def bill_params
    params.require(:bill).permit(:name, :amount, :is_paid, :due_date, bill: [:name, :amount, :is_paid, :due_date])
  end

  def set_bill
    @bill = current_user.bills.find(params[:id])
  end
end