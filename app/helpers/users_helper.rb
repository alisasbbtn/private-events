module UsersHelper
  def attended?(event)
    current_user.attended_events.include?(event)
  end
end
