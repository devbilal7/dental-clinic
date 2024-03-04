class AdminManagentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def client_management
    @user.role == "Administrator"
  end
end
