require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '配送先の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end

    it 'postalcodeが空だと保存できないこと' do
      @order_address.postalcode = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postalcode can't be blank", "Postalcode is invalid. Include hyphen(-)")
    end

    it 'postalcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.postalcode = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postalcode is invalid. Include hyphen(-)")
    end

    it 'area_idを選択していないと保存できないこと' do
      @order_address.area_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Area can't be blank")
    end

    it 'municipalityが空だと保存できないこと' do
      @order_address.municipality = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
    end

    it 'housenumberは空だと保存できないこと' do
      @order_address.housenumber = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Housenumber can't be blank")
    end

    it 'buildingは空でも保存できること' do
      @order_address.building = nil
      expect(@order_address).to be_valid
    end

    it 'telephoneが空だと保存できないこと' do
      @order_address.telephone = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Telephone can't be blank")
    end

    it 'telephoneが半角のハイフンを含んでいない形式でないと保存できないこと' do
      @order_address.telephone = '-'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Telephone is invalid")
    end

    it 'telephoneが12文字以上であれば登録できないこと' do
      @order_address.telephone = '123451234512345'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Telephone is invalid")
    end
  end
end