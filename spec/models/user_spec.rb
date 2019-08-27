require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#create' do
    context "保存できます" do
        it "全項目入力する" do
          expect(build(:user)).to be_valid
        end
        it "explainなし" do
          expect(build(:user, explain: nil)).to be_valid
        end
        it "imageなし" do
          expect(build(:user, image: nil)).to be_valid
        end
        it "explainなし、imageなし" do
          expect(build(:user, explain: nil,image: nil)).to be_valid
        end
        it 'passwordとpassword_confirmationが一致する' do
          user = build(:user)
          user.valid?
          expect(user.errors[:password_confirmation]).not_to be_present
        end
    end
    context "保存できません" do
      it "全項目未入力" do
        user = User.new
        user.valid?
        expect(user.errors[:family_name_kanji]).to include("を入力してください")
      end

      it "family_name_kanjiなし" do
        user = build(:user, family_name_kanji: nil)
        user.valid?
        expect(user.errors[:family_name_kanji]).to include("を入力してください")
      end

      it "first_name_kanjiなし" do
        user = build(:user, first_name_kanji: nil)
        user.valid?
        expect(user.errors[:first_name_kanji]).to include("を入力してください")
      end

      it "family_name_canaなし" do
        user = build(:user, family_name_cana: nil)
        user.valid?
        expect(user.errors[:family_name_cana]).to include("を入力してください")
      end

      it "first_name_canaなし" do
        user = build(:user, first_name_cana: nil)
        user.valid?
        expect(user.errors[:first_name_cana]).to include("を入力してください")
      end

      it "yearなし" do
        user = build(:user, year: nil)
        user.valid?
        expect(user.errors[:year]).to include("を入力してください")
      end

      it "monthなし" do
        user = build(:user, month: nil)
        user.valid?
        expect(user.errors[:month]).to include("を入力してください")
      end

      it "dayなし" do
        user = build(:user, day: nil)
        user.valid?
        expect(user.errors[:day]).to include("を入力してください")
      end

      it "nicknameなし" do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("を入力してください")
      end

      it "emailなし" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end

      it "名前なし" do
        user = build(:user, family_name_kanji: nil, first_name_kanji: nil, family_name_cana: nil, first_name_cana: nil, nickname: nil)
        user.valid?
        expect(user.errors[:family_name_kanji]).to include("を入力してください")
      end

      it "誕生日なし" do
        user = build(:user, year: nil, month: nil, day: nil)
        user.valid?
        expect(user.errors[:year]).to include("を入力してください")
      end

      it "名前なし、誕生日なし" do
        user = build(:user, family_name_kanji: nil, first_name_kanji: nil, family_name_cana: nil, first_name_cana: nil, nickname: nil, year: nil, month: nil, day: nil)
        user.valid?
        expect(user.errors[:family_name_kanji]).to include("を入力してください")
      end

      it "名前なし、emailなし" do
        user = build(:user, family_name_kanji: nil, first_name_kanji: nil, family_name_cana: nil, first_name_cana: nil, nickname: nil, email: nil)
        user.valid?
        expect(user.errors[:family_name_kanji]).to include("を入力してください")
      end

      it "emailなし、誕生日なし" do
        user = build(:user, year: nil, month: nil, day: nil, email: nil)
        user.valid?
        expect(user.errors[:year]).to include("を入力してください")
      end

      it "名前なし、誕生日なし、emailなし" do
        user = build(:user, family_name_kanji: nil, first_name_kanji: nil, family_name_cana: nil, first_name_cana: nil, nickname: nil, year: nil, month: nil, day: nil, email: nil)
        user.valid?
        expect(user.errors[:family_name_kanji]).to include("を入力してください")
      end

      it "パスワードを7文字未満" do
        user = build(:user, password: "123456", password_confirmation: "123456")
        user.valid?
        expect(user.errors[:password]).to include("は7文字以上で入力してください")
      end
      it 'passwordとpassword_confirmationが一致しない' do
        user = build(:user, password: "1234567")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
      end
      it 'passwordなし' do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end

      it "emailaddresが重複した場合" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("はすでに存在します")
      end
    end
  end
end
