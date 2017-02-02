require "spec_helper"

RSpec.describe Spree::Product, type: :model do
  subject { create(:product) }

  context "display_weight_unit" do
    it "respond to the methods" do
      expect(subject).to respond_to(:display_weight_unit)
      expect(subject).to respond_to(:display_weight_unit=)
      expect(subject).to respond_to(:display_weight)
    end
  end
end
