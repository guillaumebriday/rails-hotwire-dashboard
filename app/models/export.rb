# frozen_string_literal: true

class Export < ApplicationRecord
  after_update_commit { broadcast_replace_to 'exports', partial: 'exports/export', locals: { export: self } }

  enum status: {
    enqueued: 0,
    processing: 1,
    processed: 2
  }
end
