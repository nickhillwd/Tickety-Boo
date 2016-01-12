module AdminHelper

  def admin?
    current_user.role == "admin"
  end

end
