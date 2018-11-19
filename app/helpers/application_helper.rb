# frozen_string_literal: true

module ApplicationHelper
  def flash_class(level)
    case level
    when 'notice' then
      'alert alert-info'
    when 'success' then
      'alert alert-success'
    when 'error' then
      'alert alert-danger'
    when 'alert' then
      'alert alert-danger'
    end
  end

  def flash_collect_alerts(flash)
    flash.to_hash.slice('notice', 'success', 'error', 'alert')
  end
end
