module SolidusWeightsUnits
  # A class responsible to convert values from one unit to another
  # It's currently using the `ruby-units` gem
  class UnitConverter
    attr_reader :value, :unit

    # @param value [Number] the input value
    # @param unit [String] the input unit
    def initialize(value:, unit:)
      @value = value
      @unit = unit
    end

    # Converts the input value to another unit.
    #
    # @param result_unit [String] the output unit
    # @return [Number] the scalar result of the conversion
    def to(result_unit)
      RubyUnits::Unit.new("#{value} #{unit}").
                      convert_to(result_unit).
                      scalar
    end
  end
end
