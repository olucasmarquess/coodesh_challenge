require 'rails_helper'

RSpec.describe Product, type: :model do
  it "is valid with valid attributes" do
    product = build(:product, product_name: "Test Product", code: "12345")
    expect(product).to be_valid
  end

  it "is not valid without a product name" do
    product = build(:product, product_name: nil, code: "12345")
    expect(product).not_to be_valid
  end
end
