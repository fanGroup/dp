class SalesDatatable
  
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Sale.count,
      iTotalDisplayRecords: sales.total_entries,
      aaData: data
    }
  end

private

  def data
    sales.map do |sale|
      [
        h(sale.id),
        h(sale.date),
        h(sale.amount),
      ]
    end
  end

  def sales
    @sales ||= fetch_sales
  end

  def fetch_sales
    sales = Sale.order("#{sort_column} #{sort_direction}")
    sales = sales.page(page).per_page(per_page)
    if params[:sSearch].present?
      sales = sales.where("date ilike :search", 
                            search: "%#{params[:sSearch]}%")
    end
    sales
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[ id date amount ]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end