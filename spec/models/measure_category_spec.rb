require 'rails_helper'

RSpec.describe MeasureCategory, type: :model do
  it { should belong_to :measure }
  it { should belong_to :category }
  it { should validate_uniqueness_of(:category_id).scoped_to(:measure_id) }
end
