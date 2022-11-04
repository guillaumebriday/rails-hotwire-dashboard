# frozen_string_literal: true

module OrderHelper
  def order_badge(order)
    tag.span(order.status, class: class_names('badge', order_badge_class(order)))
  end

  def order_badge_class(order)
    {
      'draft' => 'text-bg-secondary',
      'sent' => 'text-bg-info',
      'paid' => 'text-bg-success'
    }[order.status]
  end
end
