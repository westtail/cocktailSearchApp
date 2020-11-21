class RankingsController < ApplicationController
    def index
        @q = Cocktail.ransack(params[:q])
        search_list = @q.result
        rank_list = Cocktailmark.all_ranking
        @search_rank_list = rank_list & search_list
        @search_rank_number = ranking_number
    end

    private
    def ranking_number
        list = []
        for i in @search_rank_list do
            id = i.id
            number = Cocktailmark.marks_number(id)
            list << number
        end
        return list
    end
end