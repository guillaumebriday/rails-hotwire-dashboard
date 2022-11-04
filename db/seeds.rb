# frozen_string_literal: true

require 'faker'

Order.destroy_all

10.times do
  order = Order.create(status: rand(0..2))

  rand(1..10).times do
    OrderItem.create(
      order:,
      name: Faker::Commerce.product_name,
      quantity: rand(1..10),
      unit_price: rand(10.0..1000.0).round(2)
    )
  end
end
