require "spec_helper"

RSpec.feature "Product admin", type: :feature do
  stub_authorization!

  let(:product) { create(:product, display_weight_unit: nil) }
  let(:unit) { Spree::Variant::WEIGHT_UNITS.first }

  scenario "I can set a weight unit" do
    visit spree.edit_admin_product_path(product)
    select(unit, from: "product_display_weight_unit")
    click_button Spree.t('actions.update')

    expect(product.reload.display_weight_unit).to eq(unit)
  end

  scenario "the inserted weight gets converted" do
    visit spree.edit_admin_product_path(product)
    select("lbs", from: "product_display_weight_unit")
    fill_in("product_weight", with: 100.02)
    click_button Spree.t('actions.update')

    expect(product.reload.weight).to eq(45_368.31)
  end
end
