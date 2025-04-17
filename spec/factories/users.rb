FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              do
      'a1' + Faker::Internet.password(min_length: 4,
                                      mix_case: true, special_characters: false)
    end
    password_confirmation { password }
    last_name             { 'ひら' }
    first_name            { 'しま' }
    last_name_kana        { 'ヒラ' }
    first_name_kana       { 'シマ' }
    birthday              { Faker::Date.birthday }
  end
end
 