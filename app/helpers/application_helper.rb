module ApplicationHelper
  def admin?
    @user.try(:admin?)
  end
end
