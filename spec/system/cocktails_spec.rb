require 'rails_helper'

RSpec.describe "ホーム画面のテスト", type: :system do

    describe "ホーム画面のレイアウト" do
        it "ホームタイトルがカクテルホーム" do
          visit cocktails_path
          # have_selecter でタグを指名
          expect(page).to have_selector 'h1', text: 'カクテル検索'
        end
      end
end