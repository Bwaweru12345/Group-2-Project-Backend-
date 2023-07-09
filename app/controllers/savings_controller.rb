class SavingsController < ApplicationController
  before_action :set_saving, only: [:show, :edit, :update, :destroy]

  def index
    @savings = Saving.all
    render json: @savings
  end

  def show
    render json: @saving
  end

  def new
    @saving = Saving.new
  end

  def create
    @saving = Saving.new(saving_params)
    if @saving.save
      render json: @saving, status: :created
    else
      render json: { errors: @saving.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @saving.update(saving_params)
      render json: @saving
    else
      render json: { errors: @saving.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @saving.destroy
    head :no_content
  end

  private

  def set_saving
    @saving = Saving.find(params[:id])
  end

  def saving_params
    params.require(:saving).permit(:user_id, :amount)
  end
end