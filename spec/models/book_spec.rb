require 'rails_helper'

RSpec.describe Book, type: :model do
  before do
    @book = FactoryBot.build(:book)
    @book.user = FactoryBot.build(:user)
  end

  describe '本情報の登録' do
    context '本情報の登録が上手くいくとき' do
      it '必要情報(use_id,title,publisher,author)の情報が揃っていれば登録できる' do
        expect(@book).to be_valid
      end
    end
    context '本情報の登録が上手くいかないとき' do
      it 'ユーザーの情報が無いと登録出来ない' do
        @book.user_id = nil
        @book.valid?
        expect(@book.errors.full_messages).to include('ユーザーを入力してください')
      end
      it 'タイトル項目が空だと登録ができない' do
        @book.title = ''
        @book.valid?
        expect(@book.errors.full_messages).to include('タイトルを入力してください')
      end
      it '出版社項目が空だと登録ができない' do
        @book.publisher = ''
        @book.valid?
        expect(@book.errors.full_messages).to include('出版社を入力してください')
      end
      it '著者項目が空だと登録ができない' do
        @book.author = ''
        @book.valid?
        expect(@book.errors.full_messages).to include('著者を入力してください')
      end
    end
  end
end
