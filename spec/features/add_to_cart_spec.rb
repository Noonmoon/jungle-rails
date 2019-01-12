require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      id: 1,
      name: Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.9
    )
  end

  scenario ", they click item add to cart, item is added" do
    visit root_path
    add_product_to_cart = find('button.btn-primary')
    add_product_to_cart.click if add_product_to_cart.visible?

    expect(page).to have_text 'Cart (1)'

    # save_screenshot
  end
end