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

      validates :display_weight_unit, inclusion: { in: WEIGHT_UNITS + [nil] }
    end
  end
end
