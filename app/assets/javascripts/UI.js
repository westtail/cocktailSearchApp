// お気に入りカクテルの開け閉め
$(document).on('turbolinks:load',function () {
    $('.title_ucer_cocktail').on('click', () => {
        $('.user_cocktail .cocktail-list').toggle();
    });
});

$(document).on('turbolinks:load',function () {
    $('.title_like_cocktail').on('click', () => {
        $('.like_cocktail .cocktail-list').toggle();
    });
});

// 検索のクリア機能
$(document).on('turbolinks:load',function () {
    $('#clear-form').on('click', () => {
        $('#q_name_cont').val("");
        $('#q_base_alcohol_cont').val("");
        $('#q_taste_cont').val("");
        $('#q_glass_type_cont').val("");
        $('#q_alcohol_percentage_cont').val("");
    });
});