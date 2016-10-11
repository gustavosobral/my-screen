module Api
  class AuthController < Api::ApplicationController
    before_action :authenticate_terminal!

    def login_channel
    end
  end
end
