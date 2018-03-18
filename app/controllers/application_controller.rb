class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def ensure_admin!
    unless current_user and current_user.admin?
      flash[:danger] = "Ви не маєте доступу!"
      redirect_to root_path
    end
  end

  def upload_image(param, path)
    tmp = param
    @path = File.join(path, param.original_filename)
    file = File.join('app/assets/images/', @path)
    File.open(file, 'wb') do |f|
      f.write(tmp.read)
    end
    return @path
  end

end
