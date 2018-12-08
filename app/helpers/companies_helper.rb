module CompaniesHelper
  def eu_countries_list
    full_list = ISO3166::Country.all
    list = []
    full_list.each do |x|
      if x.in_eu?
        list.push(x.alpha2)
      end
    end
    list
  end
end
