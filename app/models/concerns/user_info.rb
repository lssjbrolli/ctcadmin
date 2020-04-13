# frozen_string_literal: true

module UserInfo
  extend ActiveSupport::Concern

  def on_create(x)
    x.create_id = @current_user.id
  end

  def on_update(x)
    x.update_id = @current_user.id
  end
end
