module UsersHelper
  def act_toggle(user)
    if user.activated
      'btn btn-primary'
    else
      'btn btn-danger'
    end
  end
end
