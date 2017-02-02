module SolidusWeightsUnits
  module ProductWeightsUnitsConcern
    extend ActiveSupport::Concern

    included do
      delegate :weight_unit, :weight_unit=, to: :find_or_build_master
    end
  end
end
