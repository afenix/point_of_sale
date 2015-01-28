require('spec_helper')

describe(Product) do
  it("validated the presence of name") do
    product = Product.new({:name => ""})
    expect(product.save()).to(eq(false))
  end

  it("the product belongs to the purchase") do
    purchase = Purchase.create({:description => "Bob's Purchase"})
    product = Product.create({:name => "apple", :price => 0.25, :purchase_id => purchase.id})
    expect(product.purchase()).to(eq(purchase))
  end
end
