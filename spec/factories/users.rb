FactoryBot.define do

  factory :user do
    sequence(:family_name_kanji) {Faker::Games::Pokemon.name}
    sequence(:first_name_kanji) {Faker::Name.first_name}
    sequence(:family_name_cana) {Faker::Games::Pokemon.name}
    sequence(:first_name_cana) {Faker::Name.first_name}
    sequence(:year) {Faker::Number.within(range: 1900..2019)}
    sequence(:month) {Faker::Number.within(range: 1..12)}
    sequence(:day) {Faker::Number.within(range: 1..31)}
    image               {"test.image"}
    sequence(:nickname) {Faker::JapaneseMedia::DragonBall.character}
    explain               {"モデルの単体テスト用です。"}
    sequence(:email) {Faker::Internet.email}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end

end