# require "httparty"
class Api::V1::SessionsController < ApplicationController


    def create

      url = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=#{ENV['API_KEY']}"

        body = {
            email: session_params[:email],
            password: session_params[:password],
            returnSecureToken: true
        }
        resp = Faraday.post(url, JSON.generate(body), 'Content-Type' => 'application/json')
        data = JSON.parse(resp.body)
        if(data.key?('idToken'))
          user = User.find_by(uid: data['localId'])
          render json: user
        else
          render json: data
        end
    end
# https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=[API_KEY]
    private

    def session_params
      params.require(:session).permit(:email, :password)
    end
end
