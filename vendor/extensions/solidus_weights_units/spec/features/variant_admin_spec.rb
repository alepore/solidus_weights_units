require "spec_helper"

RSpec.feature "Variant admin", type: :feature do
  stub_authorization!

  let(:variant) { create(:base_variant, weight_unit: nil) }
  let(:unit) { Spree::Variant::WEIGHT_UNITS.first }

  scenario "I can set a weight unit" do
    visit spree.edit_admin_product_variant_path(variant.product, variant)
    select(unit, from: "variant_weight_unit")
    click_button Spree.t('actions.update')

    expect(variant.reload.weight_unit).to eq(unit)
  end
end
