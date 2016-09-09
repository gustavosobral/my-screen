class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :layout_by_resource

  private

    def after_sign_in_path_for(_)
      return panel_root_path unless current_user.admin?
      admin_root_path
    end

    def after_sign_out_path_for(_)
      root_path
    end

    # Used only on not authenticated requests
    def layout_by_resource
      if devise_controller?
        'panel/application'
      else
        'application'
      end
    end
end
