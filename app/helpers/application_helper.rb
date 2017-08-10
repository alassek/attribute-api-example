module ApplicationHelper
  def nav_item(name, url)
    content_tag :li, class: current_page?(controller: name.underscore) ? 'active' : nil do
      link_to name, url
    end
  end
end
