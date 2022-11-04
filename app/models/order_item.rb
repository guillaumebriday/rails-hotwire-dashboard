# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order

  validates :name,
            :quantity,
            :unit_price,
            presence: true
end
