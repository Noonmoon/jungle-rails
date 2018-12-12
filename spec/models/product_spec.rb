require 'rails_helper'

RSpec.describe Product, type: :model do
  it "is valid with valid attributes" do
    @category = Category.new
    @category.name = "shoes"
    @category.save

    @product = Product.new
    @product.name = "air force 900"
    @product.description = "Very reasonably priced, released in 2030"
    @product.price_cents = 1010101010
    @product.quantity = 1
    @product.category_id = 1
    @product.save

    expect(@product).to be_present
  end

  it "is not valid without a name" do
    @category = Category.new
    @category.name = "shoes"
    @category.save

    @product = Product.new
    @product.name = nil
    @product.description = "Very reasonably priced, released in 2030"
    @product.price_cents = 1010101010
    @product.quantity = 1
    @product.category_id = 1
    @product.save

    expect(@product.name).to be_present
  end

  it "is not valid without a price" do
    @category = Category.new
    @category.name = "shoes"
    @category.save

    @product = Product.new
    @product.name = "air force 900"
    @product.description = "Very reasonably priced, released in 2030"
    @product.price_cents = nil
    @product.quantity = 1
    @product.category_id = 1
    @product.save

    expect(@product.price_cents).to be_present
  end

  it "is not valid without a quantity" do
    @category = Category.new
    @category.name = "shoes"
    @category.save

    @product = Product.new
    @product.name = "air force 900"
    @product.description = "Very reasonably priced, released in 2030"
    @product.price_cents = 1010101010
    @product.quantity = nil
    @product.category_id = 1
    @product.save

    expect(@product.quantity).to be_present
  end

  it "is not valid without a category" do
    @category = Category.new
    @category.name = "shoes"
    @category.save

    @product = Product.new
    @product.name = "air force 900"
    @product.description = "Very reasonably priced, released in 2030"
    @product.price_cents = 1010101010
    @product.quantity = 1
    @product.category_id = nil
    @product.save

    expect(@product.category).to be_present
  end
end
