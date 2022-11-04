# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end
end
