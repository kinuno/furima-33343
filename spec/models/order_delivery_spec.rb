require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  describe '購入情報の保存'
  before do
    @order_delivery = FactoryBot.build(:order_delivery)
  end

  context '購入情報の保存ができるとき' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_delivery).to be_valid
    end

    it '建物名は空でも保存できること' do
      @order_delivery.building = ''
      expect(@order_delivery).to be_valid
    end
  end

  context '購入情報の保存ができないとき' do
    it '郵便番号が空だと保存できないこと' do
      @order_delivery.postcode = ''
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Postcode can't be blank")
    end

    it '郵便番号は半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_delivery.postcode = '00000000'
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include('Postcode Input correctly')
    end

    it '都道府県を選択していないと保存できないこと' do
      @order_delivery.prefecture_id = 1
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include('Prefecture Select')
    end

    it '市区町村が空だと保存できないこと' do
      @order_delivery.city = ''
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空だと保存できないこと' do
      @order_delivery.housenumber = ''
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Housenumber can't be blank")
    end

    it '電話番号が空だと保存できないこと' do
      @order_delivery.telephone = ''
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Telephone can't be blank")
    end

    it '電話番号は全角数字だと保存できないこと' do
      @order_delivery.telephone = '００００００００００'
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include('Telephone Input only number')
    end

    it '電話番号は半角英字だと保存できないこと' do
      @order_delivery.telephone = 'aaaaaaa'
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include('Telephone Input only number')
    end

    it '電話番号は半角英数字混合だと保存できないこと' do
      @order_delivery.telephone = 'aaa0000bbbb'
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include('Telephone Input only number')
    end

    it '電話番号にはハイフンを含むと保存できないこと' do
      @order_delivery.telephone = '000-0000-0000'
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include('Telephone Input only number')
    end

    it '電話番号が12桁では保存できないこと' do
      @order_delivery.telephone = '000011112222'
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include('Telephone is too long (maximum is 11 characters)')
    end

    it 'tokenが空だと保存できないこと' do
      @order_delivery.token = nil
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
    end

    it 'user_idが空だと保存できないこと' do
      @order_delivery.user_id = nil
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空だと保存できないこと' do
      @order_delivery.item_id = nil
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Item can't be blank")
    end
  end
end
