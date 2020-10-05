require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'nameとdescriptionとpriceとcategoryとstatusとburdenとareaとdayが存在すれば登録できること' do
      expect(@item).to be_valid
    end

    it 'nameが空では登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空では登録できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'priceが空では登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'categoryが空--では登録できないこと' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it 'statusが空--では登録できないこと' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Status must be other than 1')
    end

    it 'burdenが空--では登録できないこと' do
      @item.burden_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Burden must be other than 1')
    end

    it 'areaが空--では登録できないこと' do
      @item.area_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Area must be other than 1')
    end

    it 'dayが空--では登録できないこと' do
      @item.day_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Day must be other than 1')
    end
  end
end
