require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'relationship' do
    it { should belong_to(:customer) }
  end

  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :price }
    it { should validate_numericality_of :price }
    it { should validate_presence_of :status }
    it { should validate_presence_of :frequency }
  end
end
