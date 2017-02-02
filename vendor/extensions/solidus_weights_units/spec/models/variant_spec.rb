require "spec_helper"

RSpec.describe Spree::Variant, type: :model do
  subject { create(:variant) }

  context "display_weight_unit" do
    it "has the attribute" do
      expect(subject.attributes).to include("display_weight_unit")
    end

    it "allows null values" do
      subject.display_weight_unit = nil
      expect(subject).to be_valid
    end

    it "has a whitelist of weight units" do
      expect(Spree::Variant::WEIGHT_UNITS).to be_kind_of(Array)
    end

    it "has a a standard weight value" do
      expect(Spree::Variant::STANDARD_WEIGHT_UNIT).to be_kind_of(String)
    end

    it "allows whitelisted values" do
      unit = Spree::Variant::WEIGHT_UNITS.first
      expect(unit).to be_present
      subject.display_weight_unit = unit
      expect(subject).to be_valid
    end

    it "does not allow any value" do
      subject.display_weight_unit = "unknown_unit"
      expect(subject).to_not be_valid
    end
  end

  describe "#display_weight" do
    it "returns the readable weight in the original unit" do
      subject.display_weight_unit = "lbs"
      subject.weight = 45368.31 # 100.02 lbs in grams
      subject.save!

      expect(subject.display_weight).to eq(100.02)
    end
  end
end
