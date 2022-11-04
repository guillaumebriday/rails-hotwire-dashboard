# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy

  enum status: {
    draft: 0,
    sent: 1,
    paid: 2
  }

  def total
    order_items.sum(:total)
  end
end
