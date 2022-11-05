# frozen_string_literal: true

module ApplicationHelper
  def by_date_options
    options_for_select([['Last Month', nil], ['Last 6 months', :last_6_months]])
  end
end
