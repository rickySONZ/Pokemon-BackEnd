class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end
# // fetch
  # GET /users/1
  def show
    @user = User.find_by(uid: params[:id])
    if @user.valid?
      render json: {
        username: @user.username,
        wins: @user.wins,
        win_streak: @user.win_streak,
        tokens: @user.tokens,
        uid: @user.uid,
        id: @user.id,
      }
    else
      render json: {error: "User Not Found"}
    end
  end

  # POST /users
  def create
    url = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=#{ENV['API_KEY']}"
      body = {
          email: params[:email],
          password: params[:password],
          returnSecureToken: true

      }

      resp = Faraday.post(url, JSON.generate(body), 'Content-Type' => 'application/json')
      data = JSON.parse(resp.body)

      if(data.key?('localId'))
        user = User.create(uid: data['localId'], username: params[:username])
        render json: user
      else
        render json: data
      end
  end

  # PATCH/PUT /users/1
  def update
    @user = User.find_by(id: params[:id])

    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, :win_streak, :wins, :tokens, :username)
    end
end
