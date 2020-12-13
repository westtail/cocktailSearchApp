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


function previewImage(id) {
    const target = this.event.target;     // イベントを発生させたオブジェクトを参照
    const file = target.files[0];       // 選択した画像ファイルを代入
    const reader = new FileReader();     // fileオブジェクトを読み込み
    reader.onloadend = function() {      // 読み込みが終了した時に発火するイベント
      preview.src = reader.result;       // ファイルの内容を返す
    };
    if (file) {
      reader.readAsDataURL(file);       // ファイルのデータを示すURLを格納
    } else {
      preview.src = "/assets/noimage-78669baefb50566af9edd4c122d33142e753d62b8b6c50768df79dce14da855c.png";
    }
  }