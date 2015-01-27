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
