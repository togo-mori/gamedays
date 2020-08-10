require 'rails_helper'

RSpec.describe Game, type: :model do
  before do
    @game = FactoryBot.build(:game)
  end

  it "タイトルが空だと登録できない" do
    @game.title = ""
    @game.valid?
    expect(@game.errors.full_messages).to include("Title can't be blank")  
  end

  it "メーカーが空だと登録できない" do
    @game.maker = ""
    @game.valid?
    expect(@game.errors.full_messages).to include("Maker can't be blank")  
  end
  it "シリーズが空だと登録できない" do
    @game.series = ""
    @game.valid?
    expect(@game.errors.full_messages).to include("Series can't be blank")  
  end
  it "ハードが空だと登録できない" do
    @game.hard = ""
    @game.valid?
    expect(@game.errors.full_messages).to include("Hard can't be blank")  
  end
  it "年が空だと登録できない" do
    @game.year = ""
    @game.valid?
    expect(@game.errors.full_messages).to include("Year can't be blank")  
  end

  
  
  
end
