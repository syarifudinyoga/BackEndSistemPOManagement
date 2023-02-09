class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authorized, only: [:auto_login]

  def show
    @user = User.all

    render json: @user
  end

  def add
    @user = User.new(user_params)
    if @user.save
        RegisMailer.new_regis(@user).deliver
        render json: {
            message: "Success Add Data User",
        }, status: 200
    else
        render json: {
            message: "Failed Add Data User",
        }, status: 400
    end
  end

  def search
    @user = User.search(params[:name])

    render json: @user
  end

  def showByID
    @user = User.find_by_id(params[:id])
    
    render json: @user    
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
        #render json: {
        #    message: "Success Update Data Employee",
        #}, status: 200
    else
        #render json: {
        #message: "Failed Update Data Employee",
        #}, status: 400
    end
  end

  def delete
    @user = User.find(params[:id])
    
    if @user.destroy
        render json: {
            message: "Success Delete Data User",
        }, status: 200
    else
        render json: {
        message: "Failed Delete Data User",
        }, status: 400
    end
  end

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end


  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:username, :password, :name, :email)
  end
end
