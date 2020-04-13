# frozen_string_literal: true

# RailsSettings Model
class SiteConfig < RailsSettings::Base
  source Rails.root.join('config/app.yml')
  namespace Rails.env
end
