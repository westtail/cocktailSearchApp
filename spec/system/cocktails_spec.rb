require 'rails_helper'
#require 'pp'

RSpec.describe "機能統合テスト", type: :system do
  before do
    ActionMailer::Base.deliveries.clear
    # ゲストユーザー作成
    @user_guest = FactoryBot.create(:user, name:'ゲストユーザー',email: 'guest@example.com',password: 'test_password',activated: true)
    # テストユーザーを作成
    @user_a = FactoryBot.create(:user, name:'テストユーザー1',email: '1test@test.test',password: 'password1',activated: true)
    @user_b = FactoryBot.create(:user, name:'テストユーザー2',email: '2test@test.test',password: 'password2',activated: true)
    @user_c = FactoryBot.create(:user, name:'テストユーザー3',email: '3test@test.test',password: 'password3',activated: false)
    @cocktails_a = FactoryBot.create(:cocktail, name:'テストカクテル1', base_alcohol: 'ジン', taste: '辛い', alcohol_percentage: '強い(30~40%)', glass_type: 'ロング',cocktail_recipe: 'テスト', user: @user_a)
    @cocktails_b = FactoryBot.create(:cocktail, name:'テストカクテル2', base_alcohol: 'ジン', taste: '辛い', alcohol_percentage: '強い(30~40%)', glass_type: 'ロング',cocktail_recipe: 'テスト', user: @user_b)
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

  describe "ゲストログイン機能" do
    before do
      visit login_path
      click_link 'ゲストユーザーログイン'
    end
    it "ログイン成功　カクテル検索ページに移動するか" do
      expect(page).to have_selector 'h1', text: 'カクテル検索'
    end
    it "ログイン成功　ユーザーページに移動できるか" do
      visit user_path(@user_guest.id)
      expect(page).to have_selector 'h1', text: 'ユーザーページ'
    end
  end

  describe "ログインなしテスト" do
    describe "遷移機能" do
      it "ホーム画面に移動したか" do
        visit root_path
        expect(page).to have_selector 'h1', text: 'ホーム'
      end
      it "検索画面に移動したか" do
        visit cocktails_path
        expect(page).to have_selector 'h1', text: 'カクテル検索'
      end
      it "検索画面にテストカクテルがあるか" do
        visit cocktails_path
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
    describe "ヘッダー機能" do
      before do
        visit root_path
      end
      it "検索ページに移動できるか" do
        visit cocktail_path(@cocktails_a.id)
        expect(page).to have_selector 'h1', text: 'カクテル詳細'
        click_on "検索ページ"
        expect(page).to have_selector 'h1', text: 'カクテル検索'
      end
      it "ホームに移動できるか" do
        click_on "ホーム"
        expect(page).to have_selector 'h1', text: 'ホーム'
      end
      it "ユーザー登録に移動できるか" do
        click_on "ユーザー登録"
        expect(page).to have_selector 'h1', text: 'ユーザー登録'
      end
      it "ランキングに移動できるか" do
        click_on "ランキング"
        expect(page).to have_selector 'h1', text: 'ランキング'
      end
      it "ログインに移動できるか" do
        click_on "ログイン"
        expect(page).to have_selector 'h1', text: 'ログイン'
      end
    end
  end
  describe "検索機能" do
    before do
      visit cocktails_path
    end
    it "カクテル名で検索でカクテルが出てくるか" do
      fill_in 'カクテル名', with: 'テストカクテル'
      click_button '検索'
      expect(page).to have_selector 'h1', text: 'カクテル検索'
      expect(page).to have_selector 'dd', text: 'テストカクテル1'
    end
    it "ベースのお酒で検索でカクテルが出てくるか" do
      select 'ジン', from: 'q[base_alcohol_cont]'
      click_button '検索'
      expect(page).to have_selector 'h1', text: 'カクテル検索'
      expect(page).to have_selector 'dd', text: 'テストカクテル1'
    end
    it "味で検索でカクテルが出てくるか" do
      select '辛い', from: 'q[taste_cont]'
      click_button '検索'
      expect(page).to have_selector 'h1', text: 'カクテル検索'
      expect(page).to have_selector 'dd', text: '辛い'
    end
    it "グラスタイプで検索でカクテルが出てくるか" do
      select 'ロング', from: 'q[glass_type_cont]'
      click_button '検索'
      expect(page).to have_selector 'h1', text: 'カクテル検索'
      expect(page).to have_selector 'dd', text: 'ロング'
    end
    it "度数で検索でカクテルが出てくるか" do
      select '強い(30~40%)', from: 'q[alcohol_percentage_cont]'
      click_button '検索'
      expect(page).to have_selector 'h1', text: 'カクテル検索'
      expect(page).to have_selector 'dd', text: '強い(30~40%)'
    end
  end
  describe "ユーザー登録　ログイン機能" do
    describe "ユーザー登録" do
      before do
        visit new_user_path
        fill_in '名前', with: 'user'
        fill_in 'メールアドレス', with: 'user_test@test.test'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード(確認)', with: 'password'
        click_button 'Create my account'
      end
      it "メールが送信されたか" do
        expect(ActionMailer::Base.deliveries.size).to eq 1
      end
    end
    #describe "アカウント有効" do
    # it "テスト" do
    #    post users_path, params: {  name: 'userw', email: 'ww@ww.ww', password:'pass' ,password_confirmation:'pass'  }
    #    user = controller.instance_variable_get('@user')
    #    pp user
    #    visit edit_account_activation_path(@user.activation_token,email: @user.email)
    #  end
    #end
  end

  describe "ランキング機能" do
    describe "ページ表示" do
      before do
        visit rankings_path
      end
      it "ページが表示されるか" do
        expect(page).to have_selector 'h1', text: 'ランキング'
      end
    end
  end
end