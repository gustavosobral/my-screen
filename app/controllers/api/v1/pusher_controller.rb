module Api
  module V1
    class AuthController < Api::V1::ApplicationController
      before_action :authenticate_terminal!

      def login_channel
      end
    end
  end
end
