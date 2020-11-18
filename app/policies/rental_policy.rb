class RentalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def create?
    return user unless @instrument.user == user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
