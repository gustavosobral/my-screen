class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :layout_by_resource

  private

    def after_sign_out_path_for(_)
      root_path
    end

    def layout_by_resource
      if devise_controller? || is_a?(Admin::ApplicationController)
        'admin/application'
      else
        'application'
      end
    end
end
