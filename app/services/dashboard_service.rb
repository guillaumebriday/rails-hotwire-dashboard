# frozen_string_literal: true

class DashboardService
  def initialize(orders)
    @orders = orders
  end

  def cumulative_orders_total
    data = orders_group_by_day.map do |_, orders|
      orders.sum(&:total)
    end

    {
      labels: orders_group_by_day.keys,
      datasets: [
        {
          label: 'Cumulative orders per day',
          backgroundColor: 'transparent',
          borderColor: '#0d6efd',
          data: data
        }
      ]
    }
  end

  def order_items_quantity
    data = orders_group_by_day.map do |_, orders|
      orders.sum { |order| order.order_items.sum(:quantity) }
    end

    {
      labels: orders_group_by_day.keys,
      datasets: [
        {
          label: 'Items sold per day',
          backgroundColor: 'transparent',
          borderColor: '#fd7e14',
          data: data
        }
      ]
    }
  end

  def best_seller_order_items
    data = {}

    OrderItem.where(order_id: @orders).find_each do |order_item|
      data[order_item.name] ||= 0
      data[order_item.name] += order_item.quantity
    end

    data = data.sort_by { |_, v| v }.reverse.to_h

    {
      labels: data.keys,
      datasets: [
        {
          label: 'Items sold',
          backgroundColor: Array.new(10) { '#d63384' },
          borderColor: Array.new(10) { '#d63384' },
          data: data.values
        }
      ]
    }
  end

  private

  def orders_group_by_day
    @orders_group_by_day ||= @orders.group_by do |order|
      I18n.l(order.created_at.to_date, format: :long)
    end
  end
end
