module SolidusWeightsUnits
  module ProductWeightsUnitsConcern
    extend ActiveSupport::Concern

    included do
      delegate :display_weight_unit, :display_weight_unit=, to: :find_or_build_master
    end
  end
end
