class AccountActivationsController < ApplicationController

    def edit
        user = User.find_by(email: params[:email])
        if user && !user.activated? && user.authenticated?(:activation, params[:id])
          user.update_attribute(:activated,    true)
          user.update_attribute(:activated_at, Time.zone.now)
          session[:user_id] = user.id
          redirect_to user, notice: 'アカウントを有効にしました'
        else
            redirect_to cocktails_path, notice: 'アカウントが有効になっていません'
        end
    end
end
