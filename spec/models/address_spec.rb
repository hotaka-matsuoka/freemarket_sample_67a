require 'rails_helper'

describe Address do
  describe '#create' do
    it "全ての登録情報が存在すれば登録できること" do
      address = build(:address)
      expect(address).to be_valid
    end
    it "zipcodeがない場合は登録できない" do
      address = build(:address, zipcode: nil)
      address.valid?
      expect(address.errors[:zipcode]).to include("can't be blank")
    end
    it "municipalityがない場合は登録できない" do
      address = build(:address, municipality: nil)
      address.valid?
      expect(address.errors[:municipality]).to include("can't be blank")
    end
    it "addressがない場合は登録できない" do
      address = build(:address, address: nil)
      address.valid?
      expect(address.errors[:address]).to include("can't be blank")
    end
    it "building_nameがない場合でも登録できる" do
      address = build(:address, building_name: "")
      expect(address).to be_valid
    end
    it "telがない場合でも登録できる" do
      address = build(:address, tel: "")
      expect(address).to be_valid
    end
    it "zipcodeが全角の場合は登録できない" do
      address = build(:address, zipcode: "１１１１１１１")
      address.valid?
      expect(address.errors[:zipcode]).to include("is invalid")
    end
    
  end
end