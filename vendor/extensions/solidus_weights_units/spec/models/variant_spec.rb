require "spec_helper"

RSpec.describe Spree::Variant, type: :model do
  subject { create(:variant) }

  context "weight_unit" do
    it "has the attribute" do
      expect(subject.attributes).to include("weight_unit")
    end

    it "allows null values" do
      subject.weight_unit = nil
      expect(subject).to be_valid
    end

    it "has a whitelist of weight units" do
      expect(Spree::Variant::WEIGHT_UNITS).to be_kind_of(Array)
    end

    it "allows whitelisted values" do
      unit = Spree::Variant::WEIGHT_UNITS.first
      expect(unit).to be_present
      subject.weight_unit = unit
      expect(subject).to be_valid
    end

    it "does not allow any value" do
      subject.weight_unit = "unknown_unit"
      expect(subject).to_not be_valid
    end

  end
end
