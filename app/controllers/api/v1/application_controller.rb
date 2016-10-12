module Api
  module V1
    class ApplicationController < ActionController::Base
      include TokenHelper
      before_action :verify_api_token

      rescue_from TokenAuthenticator::TokenInvalid, with: :token_invalid

      private

      def verify_api_token
        return if request.headers['X-Api-Token'] == ENV['API_TOKEN']
        render json: { message: 'Você não pode realizar essa ação' }, status: :forbidden
      end

      def token_invalid
        render json: { message: 'Seu token é inválido.' }, status: :unauthorized
      end
    end
  end
end
