# frozen_string_literal: true

module ExportHelper
  def export_progress(export)
    return 0 if export.total_count.zero?

    ((export.total_processed.to_f / export.total_count) * 100).round(2)
  end

  def export_badge(export)
    tag.span(export.status, class: class_names('badge', export_badge_class(export)))
  end

  def export_badge_class(export)
    {
      'enqueued' => 'text-bg-secondary',
      'processing' => 'text-bg-info',
      'processed' => 'text-bg-success'
    }[export.status]
  end
end
