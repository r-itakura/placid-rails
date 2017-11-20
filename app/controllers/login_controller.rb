class LoginController < ApplicationController
  def auth
    admin = Admin.find_by(name: params[:name])
    if admin && admin.authenticate(params[:password]) then
      reset_session
      session[:admin_id] = admin.id
      # 管理者メニューへ遷移
      redirect_to controller: :admins, action: :menu
    else
      flash.now[:referer] = params[:referer]
      @error = 'ユーザー名またはパスワードが間違っています。'
      render 'login/index'
    end
  end
end
