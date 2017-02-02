# This migration comes from solidus_weights_units (originally 20170202145209)
class RenameWeightUnitToDisplayWeightUnit < ActiveRecord::Migration[5.0]
  def change
    rename_column :spree_variants, :weight_unit, :display_weight_unit
  end
end
