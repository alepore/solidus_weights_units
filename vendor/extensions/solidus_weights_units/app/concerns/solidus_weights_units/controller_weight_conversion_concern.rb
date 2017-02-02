module SolidusWeightsUnits
  module ControllerWeightConversionConcern
    extend ActiveSupport::Concern

    included do
      before_action :convert_weight, only: [:create, :update]
    end

    private

    def convert_weight
      if (weight = params[object_name][:weight].presence) &&
         (unit = params[object_name][:display_weight_unit].presence)
        result = SolidusWeightsUnits::UnitConverter.new(value: weight, unit: unit).
                                                    to(Spree::Variant::STANDARD_WEIGHT_UNIT)
        params[object_name][:weight] = result
      end
    end
  end
end
