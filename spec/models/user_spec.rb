require 'rails_helper'
describe User do
  describe '#create' do
    it "全ての登録情報が存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid? 
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "重複したemailが存在する場合は登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: "kkk@gmail.com")
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    it "passwordが7文字以上であれば登録できること" do
      user = build(:user, password: "1111111", password_confirmation: "1111111")
      expect(user).to be_valid
    end
    it "passwordが6文字以下であれば登録できないこと" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end
    it "メールアドレスの@がない場合は登録できないこと" do
      user = build(:user, email: "kkkgmail.com")
      user.valid? 
      expect(user.errors[:email]).to include("is invalid")
    end
    it "メールアドレスのドメインが含んでない場合は登録できないこと" do
      user = build(:user, email: "kkk@gmail,com")
      user.valid? 
      expect(user.errors[:email]).to include("is invalid")
    end
    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    it "family_nameがない場合は登録できないこと" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end
    it "family_name_kanaがない場合は登録できないこと" do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("can't be blank")
    end
    it "first_name_kanaがない場合は登録できないこと" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end 
    it "first_nameが全角ではない場合は登録できないこと" do
      user = build(:user, first_name: "tanaka")
      user.valid?
      expect(user.errors[:first_name]).to include("is invalid")
    end
    it "family_nameが全角ではない場合は登録できないこと" do
      user = build(:user, family_name: "aya")
      user.valid?
      expect(user.errors[:family_name]).to include("is invalid")
    end
    it "family_name_kanaが全角ではない場合は登録できないこと" do
      user = build(:user, family_name_kana: "tanaka")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("is invalid")
    end
    it "first_name_kanaが全角ではない場合は登録できないこと" do
      user = build(:user, first_name_kana: "aya")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is invalid")
    end
    it "birth_dayがない場合は登録できないこと" do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("can't be blank")
     end
  end
end