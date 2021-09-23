# frozen_string_literal: true

module Api
  module V1
    # ActionController::API
    class ApiController < ApplicationController
      before_action :ensure_xhr_request

      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_error
      rescue_from ActionController::InvalidAuthenticityToken, with: :forbidden_error

      concerning :Login do
        private

        def authenticate!
          current_user
        end
      end

      concerning :Request do
        def ensure_xhr_request
          return if request.xhr?

          api_error(:forbidden, 'forbidden')
        end
      end

      concerning :Session do
        def current_user
          User.find(session[:user_id])
        rescue ActiveRecord::RecordNotFound
          api_error(:unauthorized, 'unauthorized')
        end

        def set_session_timeout
          return if Rails.env.production?

          session[:timeout] = Time.current + 30.seconds
        end

        def ensure_session_timeout
          return if Rails.env.production?

          return if session[:timeout].present? && Time.current < session[:timeout]

          return
          session.clear
          api_error(:unauthorized, 'session timeout')
        end
      end

      concerning :Errors do
        #
        # Renders a JSON error with a HTTP status code defined by status
        # For a list of valid Rails/HTTP statuses see:
        # http://guides.rubyonrails.org/layouts_and_rendering.html#the-status-option
        #
        # Example:
        #
        # api_error :unauthorized, 'You are not authorized to do this.'
        #

        def api_error(status, message)
          render status: status, json: { error: status, error_description: message }
        end

        def invalid_resource_error(resource)
          message = resource.errors.full_messages.to_sentence
          api_error :unprocessable_entity, message
        end

        def record_not_found_error
          api_error :not_found, 'record not found' # I18n.t('api.errors.record_not_found_error')
        end

        def not_authorized_error
          api_error :unauthorized, I18n.t('pundit.not_authorized')
        end

        def forbidden_error
          api_error :forbidden, 'forbidden'
        end
      end
    end
  end
end
