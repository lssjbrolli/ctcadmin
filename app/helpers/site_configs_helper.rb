module SiteConfigsHelper
  def get_setting(var)
    if SiteConfig.find_by(var: var).nil? && !SiteConfig[var].empty?
      SiteConfig.create(var: var, value: SiteConfig[var])
    else
      SiteConfig.find_by(var: var) || SiteConfig.create(var: var)
    end
  end
end
