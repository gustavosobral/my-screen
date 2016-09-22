module Helpers
  def submit_form
    find('input[name="commit"]').click
  end

  def click_link_by_href(href)
    find(:xpath, "//a[@href='#{href}']").click
  end

  def click_button_by_action(action)
    find("form[action='#{action}']").click_button
  end
end
