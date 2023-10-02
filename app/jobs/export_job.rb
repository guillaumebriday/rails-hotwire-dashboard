# frozen_string_literal: true

class ExportJob < ApplicationJob
  queue_as :default

  def perform(export)
    export.update(status: :processing, total_count: Order.count)

    Order.find_each.with_index do |_order, index|
      if (index % 5).zero? # Simulating slow process
        export.update(total_processed: index + 1)
        sleep 1
      end

      # Do something here with order
    end

    export.update(status: :processed, total_processed: Order.count)
  end
end
