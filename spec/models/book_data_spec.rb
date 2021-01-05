require 'rails_helper'

RSpec.describe BookData, type: :model do
  before do
    @book_data = FactoryBot.build(:book_data)
  end

  describe '本情報の登録' do
    context '本情報の登録が上手くいくとき' do
      it '必要情報(use_id,,isbn,title,publisher,author,mood_text)の情報が揃っていれば登録できる' do
        expect(@book_data).to be_valid
      end
    end
    context '本情報の登録が上手くいかないとき' do
      it 'ユーザーの情報が無いと登録出来ない' do
        @book_data.user_id = ''
        @book_data.valid?
        expect(@book_data.errors.full_messages).to include('ユーザーを入力してください')
      end
      it 'タイトル項目が空だと登録ができない' do
        @book_data.title = ''
        @book_data.valid?
        expect(@book_data.errors.full_messages).to include('タイトルを入力してください')
      end
      it '出版社項目が空だと登録ができない' do
        @book_data.publisher = ''
        @book_data.valid?
        expect(@book_data.errors.full_messages).to include('出版社を入力してください')
      end
      it '著者項目が空だと登録ができない' do
        @book_data.author = ''
        @book_data.valid?
        expect(@book_data.errors.full_messages).to include('著者を入力してください')
      end
      it '感情の項目が空だと登録できない' do
        @book_data.mood_text = ''
        @book_data.valid?
        expect(@book_data.errors.full_messages).to include('感情の項目を入力してください')
      end
    end
  end
end
