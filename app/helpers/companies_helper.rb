# frozen_string_literal: true

module CompaniesHelper
  def eu_countries_list
    full_list = ISO3166::Country.all
    list = []
    full_list.each do |x|
      list.push(x.alpha2) if x.in_eu?
    end
    list
  end
end
