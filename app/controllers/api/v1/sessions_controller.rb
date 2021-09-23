# frozen_string_literal: true

module Api
  module V1
    class SessionsController < Api::V1::ApiController
      before_action :authenticate!, only: %i[pinga]
      before_action :ensure_session_timeout, only: %i[pinga]
      skip_before_action :verify_authenticity_token, only: %i[login logout]

      def login
        user = User.where(name: params[:name]).first
        user = user.authenticate(params[:password]) if user.present?
        Rails.logger.error '1111111'

        if user
          set_session_timeout
          session[:user_id] = user.id
          render json: { message: "authenticated: id #{user.id} name: #{user.name}" }, status: :ok
        else
          api_error(:unauthorized, 'unauthorized')
        end
      end

      def logout
        session.clear
        render json: { message: 'logged out' }, status: :ok
      end

      def ping
        Rails.logger.error '1111111'

        render json: { message: "pong: at #{Time.current}" }, status: :ok
      end

      def pinga
        data = session[:user_id]
        Rails.logger.debug '1111111'
        # binding.pry
        Rails.logger.debug "sessions[:user_id]: #{data}"
        if data
          render json: { message: "ping w/ auth OK at: #{Time.current}" }, status: :ok
        else
          api_error(:unauthorized, 'unauthorized')
        end
      end
    end
  end
end
