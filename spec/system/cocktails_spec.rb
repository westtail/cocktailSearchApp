require 'rails_helper'

RSpec.describe "機能統合テスト", type: :system do
  before do
    # テストユーザーを作成
    @user_a = FactoryBot.create(:user, name:'テストユーザー1',email: '1test@test.test',password: 'password1',activated: true)
    @user_b = FactoryBot.create(:user, name:'テストユーザー2',email: '2test@test.test',password: 'password2',activated: true)
    @user_c = FactoryBot.create(:user, name:'テストユーザー3',email: '3test@test.test',password: 'password3',activated: false)
    @cocktails_a = FactoryBot.create(:cocktail, name:'テストカクテル1', base_alcohol: 'ジン', taste: '辛い', alcohol_percentage: '40', glass_type: 'ロング',cocktail_recipe: 'テスト', user: @user_a)
    @cocktails_b = FactoryBot.create(:cocktail, name:'テストカクテル2', base_alcohol: 'ジン', taste: '辛い', alcohol_percentage: '40', glass_type: 'ロング',cocktail_recipe: 'テスト', user: @user_b)
  end
  describe "ログイン機能" do
    before do
      visit login_path
      fill_in 'Email', with: '1test@test.test'
      fill_in 'Password', with: 'password1'
      click_button 'login'
    end
    it "ログイン成功　カクテル検索ページに移動するか" do
      expect(page).to have_selector 'h1', text: 'カクテル検索'
    end
    it "ログイン成功　ユーザーページに移動できるか" do
      visit user_path(@user_a.id)
      expect(page).to have_selector 'h1', text: 'ユーザーページ'
    end
    it "ログインが成功しユーザーページに移動して登録カクテルがあるか" do
      visit user_path(@user_a.id)
      expect(page).to have_content 'テストカクテル1'
    end
    it "ログインが成功しユーザーページに移動して他のカクテルがないか" do
      visit user_path(@user_a.id)
      expect(page).to have_no_content 'テストカクテル２'
    end
  end

  describe "ログインなし遷移機能" do
    before do
      visit root_path
    end
    it "ホーム画面に移動したか" do
      # have_selecter でタグを指名
      expect(page).to have_selector 'h1', text: 'カクテル検索'
    end
    it "ホーム画面にテストカクテルがあるか" do
      expect(page).to have_content 'テストカクテル1'
    end
    it "カクテル詳細を確認できるか" do
      visit cocktail_path(@cocktails_a.id)
      expect(page).to have_selector 'h1', text: 'カクテル詳細'
    end
    it "詳細から一覧に戻れるか" do
      visit cocktail_path(@cocktails_a.id)
      expect(page).to have_selector 'h1', text: 'カクテル詳細'
      click_on "ホームへ戻る"
      expect(page).to have_selector 'h1', text: 'カクテル検索'
    end
  end
end