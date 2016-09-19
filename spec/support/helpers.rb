module Helpers
  def submit_form
    find('input[name="commit"]').click
  end

  def click_link_by_href(href)
    find(:xpath, "//a[@href='#{href}']").click
  end
end
