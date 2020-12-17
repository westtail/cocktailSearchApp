class ApplicationController < ActionController::Base
    helper_method :current_user
    before_action :header_search

    def header_search
        @search = Cocktail.ransack(params[:q])
        @cocktails= @search.result(distinct: true).page(params[:page]).per(18)
    end
    private

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] 
    end

    def login_required
        redirect_to login_path, notice: "ログインをしてください" unless current_user
    end
end
