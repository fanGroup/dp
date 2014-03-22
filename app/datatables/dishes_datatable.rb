class DishesDatatable
  
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Dish.count,
      iTotalDisplayRecords: dishes.total_entries,
      aaData: data
    }
  end

private

  def data
    dishes.map do |dish|
      [
        link_to(dish.name, dish),
        h(dish.description),
        h(dish.price),
      ]
    end
  end

  def dishes
    @dishes ||= fetch_dishes
  end

  def fetch_dishes
    dishes = Dish.order("#{sort_column} #{sort_direction}")
    dishes = dishes.page(page).per_page(per_page)
    if params[:sSearch].present?
      dishes = dishes.where("name ilike :search or description ilike :search", 
                            search: "%#{params[:sSearch]}%")
    end
    dishes
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[ name description price ]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end