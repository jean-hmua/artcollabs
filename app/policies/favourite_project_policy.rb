class FavouriteProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create?
    true
  end

  def destroy?
    true #record.user == current_user
  end
end
