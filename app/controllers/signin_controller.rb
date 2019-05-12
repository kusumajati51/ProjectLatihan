class SigninController < ApplicationController
    before_action :authorize_access_request!, only: [:destroy]

    def create
        user = User.find_by!(email: params[:email])

        if user.authenticate(params[:password])
            payload =  { user_id: user.id }
            sessions =  JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
            tokens = sessions.login
            response.set_cookie(JWTSessions.access_cookie,
                value: tokens[:access],
                httponly: true,
                secure: Rails.env.production?)
            
            render json: {token: tokens[:access], succec: "Succes Login">}
        else
            not_found
        end
    end

    def destroy
        sessions = JWTSessions::Sessions.new(payload: payload)
        sessions.flus_by_access_payload
        render json: :ok
    end


    private

    def not_found
        render json: { error: "Cannot find such email/password combination"}, status: :not_found
    end


end
