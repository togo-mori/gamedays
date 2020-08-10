require 'rails_helper'

RSpec.describe History, type: :model do
  before do
    @history = FactoryBot.build(:history)
    @history.image = fixture_file_upload('public/images/test.png')
  end
  

  it "dateが空では登録できない" do
    @history.date = nil
    @history.valid?
    expect(@history.errors.full_messages).to include("Date can't be blank")  
  end

  it "textとimageとdateが存在すれば登録できる" do
    expect(@history).to be_valid  
  end

  it "text空でもimageが存在すれば登録できる" do
    @history.text = nil
    expect(@history).to be_valid  
  end

  it "imageがからでもtextが存在すれば登録できる" do
    @history.image = nil
    expect(@history).to be_valid  
  end

  it "textとimageが空では登録できない" do
    @history.text = nil
    @history.image = nil
    @history.valid?
    expect(@history.errors.full_messages).to include("Text can't be blank")  
  end
  
  
  
  
  
end
