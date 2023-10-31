module ApplicationHelper
  def navbar_helper(path)
    if path.include?('transacts') || path.include?('categories/')
      'shared/back'
    else
      'shared/toggle'
    end
  end

  def wallpaper
    if ['/', '/users/sign_in', '/users/sign_up'].include? request.fullpath
      'splash-page'
    else
      ''
    end
  end
end
