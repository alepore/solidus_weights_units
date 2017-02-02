require "spec_helper"

RSpec.feature "Variant admin", type: :feature do
  stub_authorization!

  let(:variant) { create(:base_variant, display_weight_unit: nil) }
  let(:unit) { Spree::Variant::WEIGHT_UNITS.first }

  scenario "I can set a weight unit" do
    visit spree.edit_admin_product_variant_path(variant.product, variant)
    select(unit, from: "variant_display_weight_unit")
    click_button Spree.t('actions.update')

    expect(variant.reload.display_weight_unit).to eq(unit)
  end

  scenario "the inserted weight gets converted" do
    visit spree.edit_admin_product_variant_path(variant.product, variant)
    select("lbs", from: "variant_display_weight_unit")
    fill_in("variant_weight", with: 100.02)
    click_button Spree.t('actions.update')

    expect(variant.reload.weight).to eq(45368.31)
  end
end
