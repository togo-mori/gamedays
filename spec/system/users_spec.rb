require 'rails_helper'

RSpec.describe "Users", type: :system do
  it "ログインしていない場合サインインページに遷移する" do
    visit root_path
    expect(current_path).to eq new_user_session_path  
  end

  it 'ログインに成功し、ルートパスに遷移する' do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
    expect(current_path).to eq new_user_session_path 
    fill_in "Email",	with: @user.email 
    fill_in "Password",	with: @user.password
    click_on "Log in"
    expect(current_path).to eq root_path  
  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    @user = FactoryBot.create(:user)
    visit root_path
    expect(current_path).to eq new_user_session_path
    fill_in "Email",	with: "aaa@aaa.com"   
    fill_in "Password",	with: @user.password
    click_on "Log in"
    expect(current_path).to eq new_user_session_path 
  end

  it "ユーザー情報を編集する" do
    @user = FactoryBot.create(:user)
    sign_in(@user)
    click_on @user.name
    expect(current_path).to eq edit_user_path(@user.id)
    fill_in "Email",	with: "aaa@aaa.com"
    click_on "Update"
    expect(current_path).to eq root_path    
  end

  it "ログアウト" do
    @user = FactoryBot.create(:user)
    sign_in(@user)
    click_on @user.name
    expect(current_path).to eq edit_user_path(@user.id)
    click_on "Log out"
    expect(current_path).to eq new_user_session_path  
  end
  
  
end
