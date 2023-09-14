module ApplicationHelper
  def flash_alert_class(type)
    case type
    when 'error'
      'alert-warning'
    when 'success'
      'alert-success'
    else
      'alert-secondary'
    end
  end

  def navbar_helper(path)
    if path.include?('transacts') || path.include?('categories/')
      'shared/back'
    else
      'shared/toggle'
    end
  end
end
