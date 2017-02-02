module SolidusWeightsUnits
  module VariantWeightsUnitsConcern
    extend ActiveSupport::Concern

    included do
      WEIGHT_UNITS = [
        "kilograms",
        "grams",
        "lbs",
        "ounces"
      ]

      STANDARD_WEIGHT_UNIT = "grams"

      validates :display_weight_unit, inclusion: { in: WEIGHT_UNITS + [nil] }
    end

    def display_weight
      result = UnitConverter.new(value: weight, unit: STANDARD_WEIGHT_UNIT).
                             to(display_weight_unit)
      result.round(2)
    end
  end
end
