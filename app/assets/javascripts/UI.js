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