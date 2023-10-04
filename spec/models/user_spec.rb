require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    it '必須フィールドがすべて存在すればユーザーが登録できること' do
      user = User.new(
        nickname: 'testuser',
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password',
        first_name: '太郎',
        last_name: '山田',
        kana_first_name: 'タロウ',
        kana_last_name: 'ヤマダ',
        date_of_birth: Date.new(1990, 1, 1)
      )
      expect(user).to be_valid
    end

    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
  
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
  
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
  
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = 'wordpass'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
  
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
  
    it 'kana_first_nameが空では登録できない' do
      @user.kana_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name can't be blank")
    end
  
    it 'kana_last_nameが空では登録できない' do
      @user.kana_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name can't be blank")
    end
  
    it 'date_of_birthが空では登録できない' do
      @user.date_of_birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of birth can't be blank")
    end
  
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Date of birth can't be blank")
    end
  
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testexample.com' # @を含まない
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
  
    it 'passwordが5文字以下では登録できない' do
      @user.password = 'passw' # 5文字以下
      @user.password_confirmation = 'passw' # 5文字以下
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  
    it 'passwordが129文字以上では登録できない' do
      @user.password = 'a' * 129
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
    end
  end
end
