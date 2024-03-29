# frozen_string_literal: true
class RecommendationPolicy < ApplicationPolicy
  def permitted_attributes
    [:title, :number, :draft, recommendation_categories_attributes: [:category_id]]
  end

  class Scope < Scope
    def resolve
      return scope.all if @user.role?('admin') || @user.role?('manager')
      scope.where(draft: false)
    end
  end
end
