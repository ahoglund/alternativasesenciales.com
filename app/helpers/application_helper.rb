module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | AlternativasEsenciales"
    end
  end
end
