FactoryBot.define do
    factory :cocktail do
        name {'テストネーム'}
        base_alcohol {'テストアルコール'}
        taste {'テストテイスト'}
        alcohol_percentage {'テストパーセント'}
        glass_type {'テストグラス'}
        cocktail_recipe {'テスト'}
        user_id {1}
        user
    end
end