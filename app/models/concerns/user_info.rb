module UserInfo
  extend ActiveSupport::Concern

  def on_create
  	logger.debug "test"
  	logger.debug @current_user.inspect
  end

  def on_update
  	
  end
end