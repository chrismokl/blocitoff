class UserPolicy < ApplicationPolicy
  def show?
    user.present? && ( user.role == 'admin' || user == record )
  end

  def index?
    user.present? && user.role == "admin"
  end
end
