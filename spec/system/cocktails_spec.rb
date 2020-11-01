require 'rails_helper'

RSpec.describe "ホーム画面のテスト", type: :system do
  before do
    # テストユーザーを作成
    @user_a = FactoryBot.create(:user)
    @user_b = FactoryBot.create(:user, name:'テストユーザー',email: '2test@test.test',password: 'password',activated: true)
    FactoryBot.create(:cocktail, user: @user_a)
    FactoryBot.create(:cocktail, name:'テストカクテル', base_alcohol: 'ジン', taste: '辛い', alcohol_percentage: '40', glass_type: 'ロング',cocktail_recipe: 'テスト', user: @user_b)
  end
  describe "ログイン機能のテスト" do
    before do
      visit login_path
      fill_in 'Email', with: 'test@test.test'
      fill_in 'Password', with: 'password'
      click_button 'login'
    end
    it "ログインが成功しカクテル検索ページに移動するか" do
      expect(page).to have_selector 'h1', text: 'カクテル検索'
    end
    it "ユーザーページに移動できるか" do
      visit user_path(@user_a.id)
      expect(page).to have_selector 'h1', text: 'ユーザーページ'
    end
    it "ログインが成功しユーザーページに移動して登録カクテルがあるか確認" do
      visit user_path(@user_a.id)
      expect(page).to have_content 'テストネーム'
    end
    it "ログインが成功しユーザーページに移動して他のカクテルがないことを確認" do
      visit user_path(@user_a.id)
      expect(page).to have_no_content 'テストカクテル'
    end
  end

  describe "ホーム画面のレイアウト" do
    it "ホームタイトルがカクテルホーム" do
      visit cocktails_path
      # have_selecter でタグを指名
      expect(page).to have_selector 'h1', text: 'カクテル検索'
    end
  end

end