Cocktail.create!(name: "ジントニック", base_alcohol: "ジン", taste: "普通", alcohol_percentage: "普通(10~20%)", glass_type:"ロング",cocktail_recipe: "コップに氷とジンを入れてステア。\nトニックウォーターをを混ぜて完成",image: open("#{Rails.root}/app/assets/images/ジントニック.JPG"))
Ingredient.create!(name:"ジン",quantity:"30ml",cocktail_id:1)
Ingredient.create!(name:"トニックウォーター",quantity:"60ml",cocktail_id:1)

Cocktail.create!(name: "モヒート", base_alcohol: "モヒート", taste: "普通", alcohol_percentage: "普通(10~20%)", glass_type:"ロング",cocktail_recipe: "コップにライムとラムと砂糖を入れてライムをつぶす。\n次にミントを入れて軽く混ぜる。\n氷、炭酸水を混ぜて完成",image: open("#{Rails.root}/app/assets/images/モヒート.JPG"))
Ingredient.create!(name:"ラム",quantity:"30ml",cocktail_id:2)
Ingredient.create!(name:"炭酸水",quantity:"45ml",cocktail_id:2)
Ingredient.create!(name:"ライム",quantity:"1/2個",cocktail_id:2)
Ingredient.create!(name:"ミント",quantity:"5枚ほど",cocktail_id:2)
Ingredient.create!(name:"砂糖",quantity:"適量",cocktail_id:2)


Cocktail.create!(name: "ハイボール", base_alcohol: "ウイスキー", taste: "普通", alcohol_percentage: "普通(10~20%)", glass_type:"ロング",cocktail_recipe: "コップに氷とウイスキーを入れてステア。\n炭酸水を混ぜて完成",image: open("#{Rails.root}/app/assets/images/ハイボール.JPG"))
Ingredient.create!(name:"ウイスキー",quantity:"30ml",cocktail_id:3)
Ingredient.create!(name:"炭酸水",quantity:"60ml",cocktail_id:3)


Cocktail.create!(name: "ウイスキーロック", base_alcohol: "ウイスキー", taste: "辛い", alcohol_percentage: "強い(30~40%)", glass_type:"ロング",cocktail_recipe: "コップに氷とウイスキーを入れてステアして完成",image: open("#{Rails.root}/app/assets/images/ウイスキーロック.JPG"))
Ingredient.create!(name:"ウイスキー",quantity:"30ml",cocktail_id:4)