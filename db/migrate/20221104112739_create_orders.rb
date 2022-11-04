# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :orders, id: :uuid do |t|
      t.integer :status, default: 0
      t.timestamps
    end

    create_table :order_items, id: :uuid do |t|
      t.string :name
      t.integer :quantity
      t.decimal :unit_price
      t.virtual :total, type: :numeric, as: 'quantity * unit_price', stored: true

      t.references :order, type: :uuid

      t.timestamps
    end
  end
end
