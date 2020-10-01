require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end

#   pending "add some examples to (or delete) #{__FILE__}"
# end

  describe '#create' do

    it "nickname、firstname、familyname、firstnamekana、familynamekana、email、password、password_confirmation、birthdayが存在すれば登録できること" do
      expect(@user.valid?).to eq true
    end

    it "nicknameがない場合は登録できないこと" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailがない場合は登録できないこと" do
      @user.email =''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailに@がない場合は登録できないこと " do
      user = build(:user, email: "aaaaaa")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it "重複したemailが存在する場合登録できないこと" do
      user = FactoryBot.create(:user, email: 'aaa@aaa.com')
      another_user = FactoryBot.build(:user, email: 'aaa@aaa.com')
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "passwordが6文字以上であれば登録できること" do
      password = Faker::Internet.password(min_length: 6, max_length: 6)
      user = build(:user, password: password, password_confirmation: password)
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      password = Faker::Internet.password(min_length: 5, max_length: 5)
      user = build(:user, password: password, password_confirmation: password)
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    it "passwordが6文字以上で、英数字の組み合わせであれば登録できること" do
      user = build(:user, password: "abcd12", password_confirmation: "abcd12")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが数字のみの場合は登録できないこと" do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors[:password]).to include("英字と数字の両方を含めて設定してください")
    end

    it "passwordが英文字のみの場合は登録できないこと" do
      @user.password = "abcdef"
      @user.valid?
      expect(@user.errors[:password]).to include("英字と数字の両方を含めて設定してください")
    end

    # it "password_confirmationがない場合は登録できないこと" do
    #   binding.pry
    #   @user.password_confirmation = nil
    #   @user.valid?
    #   expect(@user.errors[:password_confirmation]).to include("can't be blank")
    # end

    it "passwordとpassword_confirmationが一致していない場合は登録できないこと" do
      user = build(:user, password: "abcd12", password_confirmation: "1234ab")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "firstnameがない場合は登録できないこと" do
      user = build(:user, firstname: nil)
      user.valid?
      expect(user.errors[:firstname]).to include("can't be blank")
    end

    it "familynameがない場合は登録できないこと" do
      user = build(:user, familyname: nil)
      user.valid?
      expect(user.errors[:familyname]).to include("can't be blank")
    end

    it "firstnamekanaがない場合は登録できないこと" do
      user = build(:user,firstnamekana: nil)
      user.valid?
      expect(user.errors[:firstnamekana]).to include("can't be blank")
    end

    it "familynameがない場合は登録できないこと" do
      user = build(:user, familynamekana:nil)
      user.valid?
      expect(user.errors[:familynamekana]).to include("can't be blank")
    end

    it "birthdayがない場合は登録できないこと" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end
  end

  describe '#ぜんかく' do

    it "firstnameが全角文字であれば登録できること" do
      user = build(:user, firstname:"ぜんかく")
      user.valid?
      expect(user).to be_valid
    end

    it "familynameが全角文字であれば登録できること" do
      user = build(:user, familyname:"ぜんかく")
      user.valid?
      expect(user).to be_valid
    end

  end

  describe '#ゼンカクカナ' do

    it "firstnamekanaが全角カナ文字であれば登録できること" do
      user = build(:user, firstnamekana: "ゼンカクカナ")
      user.valid?
      expect(user).to be_valid
    end

    it "familynamekanaが全角カナ文字であれば登録できること" do
      user = build(:user, familynamekana: "ゼンカクカナ")
      user.valid?
      expect(user).to be_valid
    end

  end
end