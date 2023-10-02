# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order

  validates :name,
            :quantity,
            :unit_price,
            presence: true

  scope :by_product_name, ->(name) {
    where(arel_table[:name].matches("%#{name}%"))
  }

  scope :not_draft, -> {
    joins(:order).merge(Order.not_draft)
  }

  scope :sent, -> {
    joins(:order).merge(Order.by_status(:sent))
  }

  scope :paid, -> {
    joins(:order).merge(Order.by_status(:paid))
  }
end
