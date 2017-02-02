require "spec_helper"

RSpec.describe SolidusWeightsUnits::UnitConverter do
  subject { SolidusWeightsUnits::UnitConverter }

  it "raise ArgumentError with missing arguments" do
    expect { subject.new }.to raise_error(ArgumentError)
    expect { subject.new(value: 123) }.to raise_error(ArgumentError)
    expect { subject.new(value: 123, unit: "lbs") }.to_not raise_error
  end

  describe "#to" do
    it "works as expected" do
      expect(subject.new(value: 100.02, unit: "lbs").to("grams")).to eq(45368.3088474)
    end
  end

end
