require("spec_helper")

describe(Purchase) do
  it("tells which products are in it") do
    purchase = Purchase.create({:description => "Bob's Groceries"})
    product1 = Product.create({:name => "orange", :price => 0.33, :purchase_id => purchase.id})
    product2 = Product.create({:name => "banana", :price => 0.25, :purchase_id => purchase.id})
    expect(purchase.products()).to(eq([product1, product2]))
  end
end
