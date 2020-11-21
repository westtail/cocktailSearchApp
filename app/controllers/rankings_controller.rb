class RankingsController < ApplicationController
    def index
        @rank_cocktails = Cocktailmark.all_ranking
        @rank_list = ranking_number
    end

    private
    def ranking_number
        list = []
        for i in @rank_cocktails do
            id = i.id
            number = Cocktailmark.marks_number(id)
            list << number
        end
        return list
    end
end