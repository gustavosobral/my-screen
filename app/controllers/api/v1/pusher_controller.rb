module Api
  module V1
    class PusherController < Api::V1::ApplicationController
      before_action :authenticate_terminal!

      def login_channel
        response = Pusher.authenticate(params[:channel_name], params[:socket_id], {
          user_id: current_terminal.id,
          user_info: {
            name: current_terminal.title
          }
        })
        render json: response
      end
    end
  end
end
