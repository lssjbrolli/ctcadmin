module UserInfo
  extend ActiveSupport::Concern

  def on_create(x)
  	x.update(create_id: @current_user.id)
  end

  def on_update(x)
  	x.update(update_id: @current_user.id)
  end
end