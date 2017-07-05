module ApplicationHelper
  include SessionsHelper

  def full_title(page_title = '')
    base_title = 'Private Events'
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end
end
