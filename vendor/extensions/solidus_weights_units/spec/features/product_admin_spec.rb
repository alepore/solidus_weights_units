require "spec_helper"

RSpec.feature "Product admin", type: :feature do
  stub_authorization!

  let(:product) { create(:product, weight_unit: nil) }
  let(:unit) { Spree::Variant::WEIGHT_UNITS.first }

  scenario "I can set a weight unit" do
    visit spree.edit_admin_product_path(product)
    select(unit, from: "product_weight_unit")
    click_button Spree.t('actions.update')

    expect(product.reload.weight_unit).to eq(unit)
  end
end
