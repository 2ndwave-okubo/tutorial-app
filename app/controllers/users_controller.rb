class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    @user_search = User.find_by(email: @user.email)
    if @user_search.nil? == true
      if @user.save
        # 保存の成功をここで扱う。
        flash.now[:notice] = 'ユーザ登録が完了しました。'
        render 'sessions/new'
      else
        render 'new'
      end
    else
      flash.now[:alert] = 'メールアドレスが既に使用されています。'
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end
end