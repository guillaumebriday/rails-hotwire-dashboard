# frozen_string_literal: true

class CreateExports < ActiveRecord::Migration[7.0]
  def change
    create_table :exports, id: :uuid do |t|
      t.integer :status, default: 0
      t.integer :total_count, default: 0
      t.integer :total_processed, default: 0

      t.timestamps
    end
  end
end
