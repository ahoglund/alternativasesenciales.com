 class User::Search

  def initialize(search, page_number)
  	@search = search
  	@page_number = page_number
  end

  def execute_query
    if @search
      User.where("email LIKE ?", "%#{@search.downcase}%").order(
      admin: :desc, email: :asc
      ).page @page_number
    else
      User.order(admin: :desc, email: :asc).page @page_number
    end
  end
end