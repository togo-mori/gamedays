require 'rails_helper'

RSpec.describe "Histories", type: :system do
  context "historyの投稿に成功する" do
    it "テキストと画像と日時があれば投稿に成功する" do
      @user = FactoryBot.create(:user)
      sign_in(@user)
      register_game
      @game = @user.games.offset(rand(@user.games.count)).first
      click_on "#{@game.year}", match: :first
      click_on "Show-Play-History"
      fill_in "history[date]", with: I18n.l(Date.today, format: '%Y-%m-%d')
      fill_in "history[text]",	with: "aaaaaaaaaaa"
      attach_file "history[image]", "public/images/test.png", make_visible: true
      expect{
        find('input[class="submit-button"]').click
      }.to change { History.count }.by(1)
      expect(current_path).to eq game_path(@game.id)  
      expect(page).to have_css '.history-data'  
    end

    it "テキストと日時があれば投稿に成功する" do
      @user = FactoryBot.create(:user)
      sign_in(@user)
      register_game
      @game = @user.games.offset(rand(@user.games.count)).first
      click_on "#{@game.year}", match: :first
      click_on "Show-Play-History"
      fill_in "history[date]", with: I18n.l(Date.today, format: '%Y-%m-%d')
      fill_in "history[text]",	with: "aaaaaaaaaaa"
      expect{
        find('input[class="submit-button"]').click
      }.to change { History.count }.by(1)
      expect(current_path).to eq game_path(@game.id)  
      expect(page).to have_css '.history-data'  
    end
    

    it "日時と画像を入力して投稿に成功する" do
      @user = FactoryBot.create(:user)
      sign_in(@user)
      register_game
      @game = @user.games.offset(rand(@user.games.count)).first
      click_on "#{@game.year}", match: :first
      click_on "Show-Play-History"
      fill_in "history[date]", with: I18n.l(Date.today, format: '%Y-%m-%d')
      attach_file "history[image]", "public/images/test.png", make_visible: true
      expect{
        find('input[class="submit-button"]').click
      }.to change { History.count }.by(1)
      expect(current_path).to eq game_path(@game.id)  
      expect(page).to have_css '.history-data'  
    end
    
    
  end
  
end
