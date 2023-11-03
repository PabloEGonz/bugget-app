module ApplicationHelper
  def navbar_helper(path)
    if path.include?('transacts')
      'shared/back'
    elsif path.include?('categories/')
      'shared/back_home'
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
