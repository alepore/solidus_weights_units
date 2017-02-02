# This migration comes from solidus_weights_units (originally 20170202102223)
class AddWeightUnitToSpreeVariants < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_variants, :weight_unit, :string
  end
end
