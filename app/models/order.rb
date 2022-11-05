# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy

  enum status: {
    draft: 0,
    sent: 1,
    paid: 2
  }

  scope :by_status, ->(status) {
    where(status: status) if status.present?
  }

  scope :by_date, ->(query) {
    date = case query
           when 'last_6_months' then 6.months.ago
           else 1.month.ago
           end

    where(created_at: date..)
  }

  def total
    order_items.sum(:total)
  end
end
