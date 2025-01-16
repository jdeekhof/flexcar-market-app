require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { create(:category) }
  context 'validations' do
    it { should validate_uniqueness_of(:name) }
  end
end
