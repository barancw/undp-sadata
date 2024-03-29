class MeasureIndicator < ApplicationRecord
  belongs_to :measure
  belongs_to :indicator
  accepts_nested_attributes_for :measure
  accepts_nested_attributes_for :indicator

  validates :measure_id, uniqueness: { scope: :indicator_id }
end
