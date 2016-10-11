module Api
  module V1
    class AuthController < Api::V1::ApplicationController
      def login
        @terminal = Terminal.find_by(title: params[:title])
        if @terminal && @terminal.authenticate(params[:password])
          @access_token = TokenAuthenticator.create!(@terminal)
        else
          render json: { message: 'Titulo ou senha inválidos.' }, status: :bad_request
        end
      end

      def logout
        TokenAuthenticator.expire!(headers['X-Terminal-Token'])
      end
    end
  end
end
