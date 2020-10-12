module UserDashboardHelper
  def dashboard_id
    @dashboard_id ||= current_user.id
  end

  def dashboard_name
    @dashboard_name ||= current_user.name
  end

  def followees_count
    @followees_count = current_user.followees.count
  end

  def followers_count
    @followers_count = current_user.followers.count
  end

  def appointment_count
    @appointment_count = current_user.appointments.count
  end
end
