require 'rails_helper'

RSpec.feature "Visitor navigates to product#show page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      id: 1,
      name: Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 6,
      price: 15
    )
  end

  scenario "Visitor sees the product" do
    #ACT
    visit root_path
    product_title = find('h4')
    product_title.click if product_title.visible?

    #VERIFY
    expect(page).to have_css 'section.products-show',  count: 1

    #DEBUG
    # save_screenshot
  end
end