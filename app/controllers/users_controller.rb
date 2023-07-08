class UsersController < ApplicationController
  #skip_before_action :authorized, only: [:index, :create, :show, :update, :destroy]
  before_action :authenticate_request, except: [:index, :create, :show, :update, :destroy]

  def index
    users = User.all 
    render json: users 
  end
  # The show action retrieves and renders the user with the specified ID
  def show
    user = User.find(params[:id])
    render json: user
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: :not_found
  end
  
  # The create action creates a new user based on the provided user parameters
  def create
    user = User.new(user_params)
    if user.save
      render json: { message: 'User created successfully' }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  #index



  # The update action updates the user with the specified ID
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  # The destroy action deletes the user with the specified ID
  def destroy
    user = User.find(params[:id])
    user.destroy
    head :no_content
  end
  
  private
  
  # The user_params method specifies the permitted user parameters
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  # The authenticate_request method is a before_action that verifies the request's Authorization header and decodes the JWT
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
