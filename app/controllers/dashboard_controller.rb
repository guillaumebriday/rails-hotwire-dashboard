# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @orders = Order.by_date(params[:by_date])
                   .by_product_name(params[:by_product_name])
                   .order(:created_at)

    @order_items = OrderItem.where(order_id: @orders)

    service = DashboardService.new(@orders)

    @cumulative_orders_total = service.cumulative_orders_total
    @order_items_quantity = service.order_items_quantity
    @best_seller_order_items = service.best_seller_order_items
  end
end
