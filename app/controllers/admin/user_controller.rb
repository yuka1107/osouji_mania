class Admin::UserController < ApplicationController
  before_action :authenticate_admin!

  # 会員一覧
  def index
    @users = User.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path
  end

  private

  # ストロングパラメーター
  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image, :is_active)
  end
end
