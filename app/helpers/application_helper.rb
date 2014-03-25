module ApplicationHelper

  def show_page?(object)
    current_page?(action: 'show', id: object || 0)
  end

end
