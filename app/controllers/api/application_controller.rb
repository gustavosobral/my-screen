module Api
  class ApplicationController < ActionController::Base
    rescue_from TokenAuthenticator::TokenInvalid, with: :token_invalid

    private

    def token_invalid
      render json: { message: 'Seu token é inválido.' }, status: :unauthorized
    end
  end
end
