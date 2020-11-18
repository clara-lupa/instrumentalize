class RentalPolicy < ApplicationPolicy
  # this was just created to be able to test the edit rentals action. should be overwritten by an actual policy
  # -------------------------------------
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  # -------------------------------------------
end
