require 'rails_helper'

RSpec.describe "Games", type: :system do
  context "投稿に失敗" do
    it "Titleが空だと投稿できない" do
      @user = FactoryBot.create(:user)
      sign_in(@user)
      click_on "Register Game"
      fill_in "Title",	with: ""
      fill_in "Series",	with: "aaaaaa"
      select "2020", from: "Year"
      select "任天堂", from: "Maker"
      select "3DS", from: "Hard" 
      expect{
        find('input[class="submit-button"]').click
      }.not_to change { Game.count }
      expect(current_path).to eq new_game_path
    end

    it "Seriesが空だと投稿できない" do
      @user = FactoryBot.create(:user)
      sign_in(@user)
      click_on "Register Game"
      fill_in "Title",	with: "aaaaaa"
      fill_in "Series",	with: ""
      select "2020", from: "Year"
      select "任天堂", from: "Maker"
      select "3DS", from: "Hard"
      expect{
        find('input[class="submit-button"]').click
      }.not_to change { Game.count }
      expect(current_path).to eq new_game_path
    end

    it "Yearが空だと投稿できない" do
      @user = FactoryBot.create(:user)
      sign_in(@user)
      click_on "Register Game"
      fill_in "Title",	with: "aaaaa"
      fill_in "Series",	with: "aaaaa"
      select "年を選択してください", from: "Year"
      select "任天堂", from: "Maker"
      select "3DS", from: "Hard" 
      expect(page).to have_select("Year", selected: "年を選択してください")  
      expect{
        find('input[class="submit-button"]').click
      }.not_to change { Game.count }
      expect(current_path).to eq new_game_path
    end

    it "Makerが空だと投稿できない" do
      @user = FactoryBot.create(:user)
      sign_in(@user)
      click_on "Register Game"
      fill_in "Title",	with: "aaaaa"
      fill_in "Series",	with: "aaaaa"
      select "2020", from: "Year"
      select "メーカーを選択してください", from: "Maker"
      select "3DS", from: "Hard" 
      expect{
        find('input[class="submit-button"]').click
      }.not_to change { Game.count }
      expect(current_path).to eq new_game_path
    end

    it "Hardが空だと投稿できない" do
      @user = FactoryBot.create(:user)
      sign_in(@user)
      click_on "Register Game"
      fill_in "Title",	with: "aaaaa"
      fill_in "Series",	with: "aaaaa"
      select "2020", from: "Year"
      select "任天堂", from: "Maker"
      select "ハードを選択してください", from: "Hard" 
      expect(page).to have_select("Hard", selected: "ハードを選択してください")  
      expect{
        find('input[class="submit-button"]').click
      }.not_to change { Game.count }
      expect(current_path).to eq new_game_path
    end

    
  end

  context "投稿に成功" do
    
  end
  
  
  
 
  
end
