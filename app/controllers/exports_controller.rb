# frozen_string_literal: true

class ExportsController < ApplicationController
  def index
    @exports = Export.order(created_at: :desc)
  end

  def create
    @export = Export.create

    ExportJob.perform_later(@export)

    redirect_to exports_path
  end
end
