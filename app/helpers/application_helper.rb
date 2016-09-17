module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '', base_title = 'MyScreen')
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  # Returns the original user on switch_user feature.
  def original_user
    if (original_user_id = session[:original_user_id])
      User.find(original_user_id)
    end
  end
end
