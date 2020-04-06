require 'rails_helper'

describe Address do
  describe '#create' do
    it "全ての登録情報が存在すれば登録できること" do
      address = build(:address)
      expect(address).to be_valid
    end
    it "郵便番号がない場合は登録できない" do
      address = build(:address, zipcode: nil)
      address.valid?
      expect(address.errors[:zipcode]).to include("can't be blank")
    end
    it "郵便番号が全角の場合は登録できない" do
      address = build(:address, zipcode: "１１１１１１１")
      address.valid?
      expect(address.errors[:zipcode]).to include("is invalid")
    end
    it "郵便番号が8文字以上の場合は登録できない" do
      address = build(:address, zipcode: "12345678")
      address.valid?
      expect(address.errors[:zipcode]).to include("is invalid")
    end
    it "郵便番号にハイフンが含まれている場合は登録できない" do
      address = build(:address, zipcode: "123-456")
      address.valid?
      expect(address.errors[:zipcode]).to include("is invalid")
    end
    it "郵便番号が6文字以下の場合は登録できない" do
      address = build(:address, zipcode: "12345678")
      address.valid?
      expect(address.errors[:zipcode]).to include("is invalid")
    end
    it "市町村区がない場合は登録できない" do
      address = build(:address, municipality: nil)
      address.valid?
      expect(address.errors[:municipality]).to include("can't be blank")
    end
    it "番地がない場合は登録できない" do
      address = build(:address, address: nil)
      address.valid?
      expect(address.errors[:address]).to include("can't be blank")
    end
    it "建物名がない場合でも登録できる" do
      address = build(:address, building_name: "")
      expect(address).to be_valid
    end
    it "電話番号がない場合でも登録できる" do
      address = build(:address, tel: "")
      expect(address).to be_valid
    end
  end
end