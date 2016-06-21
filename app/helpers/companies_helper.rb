module CompaniesHelper
  def eu_countries_list
    full_list = ISO3166::Country.find_all_countries_by_eu_member(true)
    list = []
    full_list.each {|x| list.push(x.alpha2)}
    list
  end
end
