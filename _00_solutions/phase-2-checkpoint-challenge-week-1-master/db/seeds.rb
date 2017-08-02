require 'faker'

Store.destroy_all
Location.destroy_all
Product.destroy_all

5.times do
  store = Store.create({
    :name => Faker::Company.name,
  })
  2.times do 
  	location = Location.create({
  		address: Faker::Address.street_address
  		})
  	store.locations << location
  	store.save 

  	5.times do 
  		product = Product.create(
  			name: Faker::Commerce.product_name
  			)
  		location.products << product
  		location.save
  	end
  end
end
