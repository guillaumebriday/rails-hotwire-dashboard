# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[show]

  def index
    @orders = Order.all
  end

  def show
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
