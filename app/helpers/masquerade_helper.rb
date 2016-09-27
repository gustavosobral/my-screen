module MasqueradeHelper
  # Returns the original user on switch_user feature.
  def original_user
    return unless (original_user_id = session[:original_user_id])
    User.find(original_user_id)
  end
end
