# frozen_string_literal: true

module SiteConfigsHelper
  def get_setting(var)
    if SiteConfig.find_by(var: var).nil?
      SiteConfig.create(var: var)
    else
      SiteConfig.find_by(var: var)
    end
  end
end
