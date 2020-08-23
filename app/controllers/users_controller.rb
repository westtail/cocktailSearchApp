class UsersController < ApplicationController

  before_action :login_required, only: [:show]

  def show
    @user = User.find(params[:id])
    @cocktails = current_user.cocktails
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "ユーザー「#{@user.name}」が登録されました"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
