class PersonalsController < ApplicationController
  before_action :authenticate_request
  before_action :set_personal, only: [:destroy]

  def index
    personals = @current_user.personals
    render json: personals
  end


  def create
    personal = @current_user.personals.build(personal_params)
    if personal.save
      render json: personal, status: :created
    else
      render json: { errors: personal.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @personal.destroy
    head :no_content
  end

  private

  def personal_params
    params.require(:personal).permit(:name, :amount)
  end

  def set_personal
    @personal = @current_user.personals.find(params[:id])
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
