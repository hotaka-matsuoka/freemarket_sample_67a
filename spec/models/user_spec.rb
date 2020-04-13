require 'rails_helper'
describe User do
  describe '#create' do
    it "全ての登録情報が存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "ニックネームがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    it "メールアドレスがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid? 
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "重複したメールアドレスが存在する場合は登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: "kkk@gmail.com")
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
    it "パスワードがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    it "パスワードが存在しても確認用パスワードがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    it "パスワードが7文字以上であれば登録できること" do
      user = build(:user, password: "1111111", password_confirmation: "1111111")
      expect(user).to be_valid
    end
    it "パスワードが6文字以下であれば登録できないこと" do
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
    it "苗字がない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    it "名前がない場合は登録できないこと" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end
    it "苗字（カナ）がない場合は登録できないこと" do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("can't be blank")
    end
    it "名前（カナ）がない場合は登録できないこと" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end 
    it "苗字が全角ではない場合は登録できないこと" do
      user = build(:user, first_name: "tanaka")
      user.valid?
      expect(user.errors[:first_name]).to include("is invalid")
    end
    it "名前が全角ではない場合は登録できないこと" do
      user = build(:user, family_name: "aya")
      user.valid?
      expect(user.errors[:family_name]).to include("is invalid")
    end
    it "苗字（カナ）が全角ではない場合は登録できないこと" do
      user = build(:user, family_name_kana: "tanaka")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("is invalid")
    end
    it "名前（カナ）が全角ではない場合は登録できないこと" do
      user = build(:user, first_name_kana: "aya")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is invalid")
    end
    it "誕生日がない場合は登録できないこと" do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("can't be blank")
     end
  end
end