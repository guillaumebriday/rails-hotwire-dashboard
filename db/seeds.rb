# frozen_string_literal: true

require 'faker'

Export.destroy_all
Order.destroy_all

Order.record_timestamps = false

# Limit the number of different products to 10.
products = Array.new(10) { Faker::Commerce.product_name }

100.times do
  date = rand(1.year.ago..Time.current)

  order = Order.create(
    created_at: date,
    updated_at: date,
    status: rand(0..2)
  )

  rand(1..10).times do
    OrderItem.create(
      order:,
      name: products.sample,
      quantity: rand(1..50),
      unit_price: Faker::Commerce.price
    )
  end
end

Order.record_timestamps = true
