class GuestSessionsController < ApplicationController
    def create
        @user = User.find_by(email: 'guest@example.com')
        if @user.activated?
            session[:user_id] = @user.id
            redirect_to cocktails_path, notice: 'ゲストユーザーでログインしました'
        else
            message = "アカウントが有効になっていません"
            flash[:warning] = message
            redirect_to root_url
        end
    end
end
