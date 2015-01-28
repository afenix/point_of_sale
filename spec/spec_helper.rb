ENV['RACK_ENV'] = 'test'
require('sinatra/activerecord')
require('sinatra')
require('rspec')
require('pg')
require('pry')
require('product')
require('purchase')

RSpec.configure do |config|
  config.after(:each) do
    Product.all().each() do |product|
      product.destroy()
    end
  end
end
