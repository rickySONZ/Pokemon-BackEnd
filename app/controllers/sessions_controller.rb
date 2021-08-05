require "httparty"
class SessionsController < ApplicationController


    def create

      url = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=#{ENV['API_KEY']}"

        body = {
            email: session_params[:email],
            password: session_params[:password],
            returnSecureToken: true
        }
        resp = Faraday.post(url, JSON.generate(body), 'Content-Type' => 'application/json')
        data = JSON.parse(resp.body)
        # byebug
        render json: data

    end
# https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=[API_KEY]
    private

    def session_params
      params.require(:session).permit(:email, :password)
    end
end
