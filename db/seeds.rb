Cocktail.create!(name: "ジントニック", base_alcohol: "ジン", taste: "普通", alcohol_percentage: "15(普通)", glass_type:"ロング",cocktail_recipe: "コップに氷とジンを入れてステア。\nトニックウォーターをを混ぜて完成")
Ingredient.create!(name:"ジン",quantity:"45ml",cocktail_id:1)
Ingredient.create!(name:"トニックウォーター",quantity:"45ml",cocktail_id:1)

Cocktail.create!(name: "ジンジンジャー", base_alcohol: "ジン", taste: "普通", alcohol_percentage: "15(普通)", glass_type:"ロング",cocktail_recipe: "コップに氷とジンを入れてステア。\nトニックウォーターをを混ぜて完成")
Ingredient.create!(name:"ジン",quantity:"45ml",cocktail_id:2)
Ingredient.create!(name:"ジンジャーエール",quantity:"45ml",cocktail_id:2)