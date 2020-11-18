class InstrumentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where.not(user: user)
    end
  end

  def my_instruments?
    return true
  end

  def show?
    return true
  end

  def create?
    return user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
