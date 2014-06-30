module ApplicationHelper

  def show_page?(object)
    current_page?(action: 'show', id: object || 0)
  end

  def print_date(date, format)
    date.to_s(format) if date.present?
  end

  def current_tag(tag)
    'active' if controller_path == tag
  end

 def print_date_time(date, format)
    date.to_s(format) if date.present?
 end

 def print_date(date, format)
    date.to_formatted_s(format) if date.present?
 end

end
