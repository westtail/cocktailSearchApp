User.find_or_create_by!(email: 'test@a.a') do |user|
    user.name ='テスト'
    user.email = 'test@a.a'
    user.password = 'test'
    user.password_confirmation = 'test'
end

Cocktail.first_or_create([
    {name: "ジントニック", base_alcohol: "ジン", taste: "普通", alcohol_percentage: "普通(10~20%)", glass_type:"ロング",cocktail_recipe: "コップに氷とジンを入れてステア。\nトニックウォーターをを混ぜて完成",image: open("#{Rails.root}/app/assets/images/ジントニック.JPG"), user_id: 1},
    {name: "モヒート", base_alcohol: "ラム", taste: "普通", alcohol_percentage: "普通(10~20%)", glass_type:"ロング",cocktail_recipe: "コップにライムとラムと砂糖を入れてライムをつぶす。\n次にミントを入れて軽く混ぜる。\n氷、炭酸水を混ぜて完成",image: open("#{Rails.root}/app/assets/images/モヒート.JPG"), user_id: 1},
    {name: "ハイボール", base_alcohol: "ウイスキー", taste: "普通", alcohol_percentage: "普通(10~20%)", glass_type:"ロング",cocktail_recipe: "コップに氷とウイスキーを入れてステア。\n炭酸水を混ぜて完成",image: open("#{Rails.root}/app/assets/images/ハイボール.JPG"), user_id: 1},
    {name: "ウイスキーロック", base_alcohol: "ウイスキー", taste: "辛い", alcohol_percentage: "強い(30~40%)", glass_type:"ロング",cocktail_recipe: "コップに氷とウイスキーを入れてステアして完成",image: open("#{Rails.root}/app/assets/images/ウイスキーロック.JPG"), user_id: 1},
    {name: "ウイスキーショット", base_alcohol: "ウイスキー", taste: "辛い", alcohol_percentage: "強い(30~40%)", glass_type:"ショット",cocktail_recipe: "コップに氷とウイスキーを入れてステアして完成",image: open("#{Rails.root}/app/assets/images/ウイスキーロック.JPG"), user_id: 1}
])

Ingredient.first_or_create([
    {name:"ジン",quantity:"30ml",cocktail_id:1},
    {name:"トニックウォーター",quantity:"60ml",cocktail_id:1},
    {name:"ラム",quantity:"30ml",cocktail_id:2},
    {name:"炭酸水",quantity:"45ml",cocktail_id:2},
    {name:"ライム",quantity:"1/2個",cocktail_id:2},
    {name:"ミント",quantity:"5枚ほど",cocktail_id:2},
    {name:"砂糖",quantity:"適量",cocktail_id:2},
    {name:"ウイスキー",quantity:"30ml",cocktail_id:3},
    {name:"炭酸水",quantity:"60ml",cocktail_id:3},
    {name:"ウイスキー",quantity:"30ml",cocktail_id:4},
    {name:"ウイスキー",quantity:"30ml",cocktail_id:5},
])