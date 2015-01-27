require('spec_helper')

describe(Product) do
  it("validated the presence of name") do
    product = Product.new({:name => ""})
    expect(product.save()).to(eq(false))
  end
end
