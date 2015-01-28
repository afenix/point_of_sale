require('sinatra/activerecord')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require("./lib/product")
require('pg')
require('pry')


get("/") do
  @products = Product.all()
  erb(:index)
end

post("/products") do
  name = params.fetch("name")
  price = params.fetch("price")
  @product = Product.create({:name => name, :price => price})
  @products = Product.all()
  erb(:index)
end

get('/products/:id/edit') do
  @product = Product.find(params.fetch("id").to_i())
  erb(:edit_product)
end

patch('/products/:id') do
  name = params.fetch("name")
  price = params.fetch("price")
  @product = Product.find(params.fetch("id").to_i())
  @product.update({:name => name, :price => price})
  @products = Product.all()
  erb(:index)
end

delete("/products/:id") do
  @product = Product.find(params.fetch("id").to_i())
  @product.delete()
  @products = Product.all()
  erb(:index)
end

get("/products_sum/:id") do
  @product = Product.find(params.fetch("id").to_i())
  @purchases = Purchase.all()
  erb(:actor_info)
end

patch('products_sum/:id') do
  @product_id = Product.find(params.fetch("id").to_i())
  @movie = Product.find(product_id)
  product_ids = params.fetch("product_ids")
  @product_total = product_ids.sum('price')
  @products = Product.all()
  erb(:index)
end
