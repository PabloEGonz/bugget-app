module ApplicationHelper
  def navbar_helper(path)
    if path.include?('transacts') || path.include?('categories/')
      'shared/back'
    else
      'shared/toggle'
    end
  end
end
