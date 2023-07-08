class BillsController < ApplicationController
  before_action :authenticate_request
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

  def authenticate_request
    # Extract the Authorization header
    header = request.headers['Authorization']
    if header && header.start_with?('Bearer ')
      # Get the token from the Authorization header
      token = header.split(' ').last

      # Decode and verify the token
      begin
        decoded_token = JWT.decode(token, 'your_secret_key')
        user_id = decoded_token.first['user_id']
        @current_user = User.find(user_id)
      rescue JWT::DecodeError, ActiveRecord::RecordNotFound
        render json: { error: 'Invalid token' }, status: :unauthorized
      end
    else
      render json: { error: 'Missing or invalid Authorization header' }, status: :unauthorized
    end
  end
end
