module SessionsHelper
  def user_logged_in
    SESSION[:user_id].present?
  end
end
