class SavingsController < ApplicationController
    before_action :set_savings, only: [:show, :edit, :update, :destroy]
  
    def index
      @savings = Savings.all
    end
  
    def show
    end
  
    def new
      @savings = Savings.new
    end
  
    def create
      @savings = Savings.new(savings_params)
      if @savings.save
        redirect_to @savings, notice: 'Savings created successfully.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @savings.update(savings_params)
        redirect_to @savings, notice: 'Savings updated successfully.'
      else
        render :edit
      end
    end
  
    def destroy
      @savings.destroy
      redirect_to savings_url, notice: 'Savings deleted successfully.'
    end
  
    private
  
    def set_savings
      @savings = Savings.find(params[:id])
    end
  
    def savings_params
      params.require(:savings).permit(:user_id, :amount)
    end
  end
  